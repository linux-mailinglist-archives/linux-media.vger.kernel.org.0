Return-Path: <linux-media+bounces-31145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7AA9E9A8
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3398616E923
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD981DF26A;
	Mon, 28 Apr 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DCmXz0+H"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013063.outbound.protection.outlook.com [40.107.44.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF841D6DAA;
	Mon, 28 Apr 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826059; cv=fail; b=W15+nFmt5gIf2Hp9tp3dWjtIhBlxbIwV6tqFEqeNCf0005AEKXDDLoRZ1kS74hg8nUDiijIW4TCZKBwOkiJ+mBuSrymX/ieO+hxfU1RWaqpiiFH2eJL4ymw9okI46q3aBSYaJYcj2vE0t3WWYYRQB/FbnRLp1InnMbzWH4IjrOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826059; c=relaxed/simple;
	bh=ZBBfA+dKeMj8XUaZtKNKYdsscR/UEMstqPgZ6CZLXaA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YMzmAvkhKbRHYAQmU/xQxkK7Voouifsrp4JzbcZ9DHU/xRQYzOl5GAsLwuo3XIxU/ccNAWx38+OhEsqwNzuQ306eGwPYSUfVWa9wWn4jeNEuJ1pST4f/StxnuFL4/Ik4yjqxxhKmEz0gIgO6NgyUg2m+FvIgO4jk4N3d40cRu/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DCmXz0+H; arc=fail smtp.client-ip=40.107.44.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2UV51KVFr9eptG2yI2k4Bc0Sb8RtVYnzmPIQbCTmYVkj4jl6NdgPbJXALw8/0EsCxdz/aJhMlAtd458i78hO1Yi6bxr3mP2gkVnEC0ndOjI1mUynDTvOGj23thiF/D0JKlpIIf/l+nFRkRt9j3Llr+t33W6y7zE1F2BxAgcKb4OR01gu+k5qnATPmP/IRRkwLvKkRdF8m/7zU+2LQRbXRwcEkNzaog9Soee0vg42CUq+O5hiE/JhEXk17cvEttI134PCysMJG1GZdYPeWDwP+vWfQ7smPmthvu8Cf5k6bdXdN8Y/nlml2VJl7YOYILXHHhsSM2dpojrbxmvjHlwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i1L+e51z/Ii98jhv+DzHJjGqI6VDcMW0s2pL4FUup0=;
 b=Kh0qxtmumDy/ziyiHGc4OtUGbEuZSGkcp0vUb+Mo1b7RmDxEmQzBmPREOdbGCA3SpuCR8v2cjl5f2ihtB83hqxmAknLK5AT+mXN7+/0lNzcs8O+f0IIv03boJC5qXYDiff7BxTaxx1qkQZWGnupctNTNILHUG0wPqRFac1OjJRQhFULJFMLDIaLg3Ir26ilP8RolHyF2cp3Y+RfTdQdqvaqfCrvjGVzrUJov0DwnY5iV0hAjqwfissDEBI/cOpga+R+TVawNd7u0YCKkHWGfhlaA7KxJxur/lnoxwPcNJzoRWGvxB6mZbZfb2JRvKJhBl6N8yjKVDz3z/mJ5lKb7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i1L+e51z/Ii98jhv+DzHJjGqI6VDcMW0s2pL4FUup0=;
 b=DCmXz0+HLcOqkUpZrD6aWXjTtxP7/im3o21VxW95V9+v6ItoFTu97aBx2nPyFMt4iPuYE3QK+jIVzeiEtFAFqIdJ1UfD6rplK2unX1X+VsrBM2i5WsVb5TyxBkxPoFAZPIm5ksGAXbUJ+Nb7P12chHH3g6mzj52nmyNl83SIL1G+o4fGAe62G1uqjeujIt1Tv6msv4DLZDmO2inJc6Ydr/z2xKt1KVXfKuPzJnHKkFYwOGYZjDFJDcKrJeoTxGAnS2gDWF3UyCd2zei5rkvHZCcbSb2Fk4blIqwZCdG7O37eA8PzZebBWlSJAJCnXvo24kYKGQR7p9U3rKZAJDfCMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:40:49 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:40:48 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dave Airlie <airlied@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 0/2] Fix udmabuf vmap error
Date: Mon, 28 Apr 2025 15:38:28 +0800
Message-ID: <20250428073831.19942-1-link@vivo.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7e1478-3fca-4fb6-e13b-08dd8627fe10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skzI0cX9ly/R+h1l0HDm5QKBFNkrYfF5S/JDrJ0QkASTqlnq5hyxpTOB/DhC?=
 =?us-ascii?Q?goiX3/q/x8ahlu0q6YDxn+vVcDfOxE1HpPKhHRVhkoQDcAAGmEXMMqi8dx0L?=
 =?us-ascii?Q?0mkcNFSrk4HE39ICATO9v3DgK9z6D0JmH2F+hDi5NPyrXZhZTZiZmJlFNf62?=
 =?us-ascii?Q?Q4h0jGIX37GcBSuXs7b4+IloB7WMjAbsafesRruGc17CWy8X6LHsQPJHF6PD?=
 =?us-ascii?Q?HyxxrzoZGj1dheJ99FXLbjs58bXoLOtRjNmq6knGQYQ+N/f/EoJwlAoHLj8+?=
 =?us-ascii?Q?UBBZZIP8yLgKyzdBnboQlI/O1cyuXNLzAkzTiYL5GCkRsdM789pR1Gx2OY2z?=
 =?us-ascii?Q?x9o0r4ajn1G3A6AZkAiRDyHqSrzh0p5WCVrIBOhlq89YaCZcZIEpuTlqQVQL?=
 =?us-ascii?Q?I5+RVpat+b4AI5aTtwsKAgodH1ROjLE8nHJvF9VMz/weC5wwLgXxcdhRyJqd?=
 =?us-ascii?Q?1aMjQ3YE2J2c7Jcp2bCWH4lyQDWpaC7SEHN0AIS6DvGybQLU4jc468Ic8SvK?=
 =?us-ascii?Q?dkj5YSCqsKd7xdDWI6ad11coX57FJtPnfsfQSISZUmxXuxR0se+DtH4uIQfD?=
 =?us-ascii?Q?pnxUdlP/ZGPcWP4ziOHt4vV0y7HKp7OhzchEmzhX558ljWRKby2jdB6p24b1?=
 =?us-ascii?Q?kq1bDVRP6+QW8tFF7nQhoVUPHEOZXSFHuJWyjHtOSaJ1nOUh9Zsz4PhrH4Xh?=
 =?us-ascii?Q?EBfI4UaoZHdB/6Y5F9KihVHDgRUvvhQO/lMWivBig4ZudanrX+/Pp/+mSIZn?=
 =?us-ascii?Q?Qxt97OpgYwAk8IimVtYl7J8/zVMCRwPYVfcTThKjz6zBOJrw4RtyA6HkcCOF?=
 =?us-ascii?Q?dpZ2UAoZywSJips+slDL+bWZsQs2J6AGgomlONwfJn6u9KeCeU4A5lhK7bJ4?=
 =?us-ascii?Q?2F8vY3iQF/Znz7+AKonrERV7dCsFobRW5GlynZLnLSk6GRq/BdrPebeDN3O8?=
 =?us-ascii?Q?L9o5ttcgwI81Ap2ElVM+rB30YW4s0txZ5dUDHb5cuuTZ5zAkPPZHksu5f2vk?=
 =?us-ascii?Q?WRQzchvv6/ElxQUgjMTgyelpEpVeDpGhq83uX46azuSlY0kBHfkvTTEQddKZ?=
 =?us-ascii?Q?FyCL9sNEMvXfhUETumf1pibpCy1dYlXlIVkl6bwQeYAb9CpcHe6q2wUusdmL?=
 =?us-ascii?Q?p/G8PpOtSKPX+gwxTcojT/PIyTdvKISGWeIQs75zn9NH3UEPXZELPYlK3+Dv?=
 =?us-ascii?Q?PBioB7mnPwYDlZiw7S//Z113aIeZXokXIL5XADJ9im77PymA1CcktVbami+/?=
 =?us-ascii?Q?SrOn9YgIRiKxsZFkU90r5vUPPY/RAC4wsM6K2EyYCKaXjWxlifw0EQxhEwkW?=
 =?us-ascii?Q?sKGbhLhuVnNZVSdL25ir9FGhvtn8+x4h7WYT1uGd5njS+/OUxNdkP/K/zcs7?=
 =?us-ascii?Q?dUStXSqbfIyY5XEopNN2lSJcRkMY/DiaGTjpWQ5H0v2QqhrSM2J2o+aJImIr?=
 =?us-ascii?Q?nEjEE1nETN/+lWBJhyDfQ7bjJoTbVrpVgPmseBtp6OgWgRl4bd2oa8LAyP2q?=
 =?us-ascii?Q?J2+PEn3anfgmaMQy25aQpLRa5Wz3iWKBUYPe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?006LAdW0JG1Kv8UQFanCg5taFZ53+8qYrVdH7O/u+4NWq7PqMDZZLlTIgWvV?=
 =?us-ascii?Q?urqw7gNRsL5FEb5YwX7ihGijYJHNHA/vRq+zD1pT9miQ75LiceWwssBqs1O1?=
 =?us-ascii?Q?VBXXvj6MUD436R38OlNrbVLq12Td0quigYu0pIJFNCdGdgQ8tHul9ZQPnTRY?=
 =?us-ascii?Q?IIKcq0czryLNf76wSMht2AyTzbiyMmnEqNjPyaurZZ+a/AiQ+KvcMs4i7MTT?=
 =?us-ascii?Q?XECiJ3/ly5Bc1Aymdrpg/MqTJVLWmgDA4Dbd882YnNDWXXDTmtqI7/cVH8fc?=
 =?us-ascii?Q?4ioKkcSK4B1VuogmUwqZiOErHGX5TbzfWEmoDLQnHZ2UDKmAlvdUIReWACKl?=
 =?us-ascii?Q?jdWmC6NiHtN4CznOEqybYdF1lIixuhfANhaTce0IEru82WOpBb4SNgAAzri1?=
 =?us-ascii?Q?4zqI0IFfdY6X6+u4wojzPXQNDl3DFCErLHhaCx+B+1aPXtplbxH0ml12edaq?=
 =?us-ascii?Q?A/LXKNwZ6U5VuKQXnx7OqcVijPD3N8ijrh7R6s60zonTXxnb54jye3dWF0Wk?=
 =?us-ascii?Q?R95qr9yscCODMr1sgtpoqlvYchZSThjQiD/iptqAiHS9FjgnEXU3kIeZd7n/?=
 =?us-ascii?Q?jmR5mLNDI32RUJ+f0NTW4mwY+vG4xnUlP/fnriJnZQQly9h611lYze0epbui?=
 =?us-ascii?Q?fqoIYcb8UF0Iop4xlWOYuR+29WNbDvGe099Vn6WCT75mIQj6TnBvoxwf7l2M?=
 =?us-ascii?Q?0wuNL4zfKEY9TxNOmv3uxTmA0TGEMGJ70kFBuZsUYyzZGVITkTlT1WG28mNo?=
 =?us-ascii?Q?gaJ1XqU24XJzvv2p4JVQPlxlC04ddgEHQlND2WGvmUlVN+r02jyp18H0qseJ?=
 =?us-ascii?Q?v4IQ3ALm6Ar26vBFgiy4YIiRL834rnoxq1joGZ46PIeSZWZFyikpqa//wiZi?=
 =?us-ascii?Q?9PBuP4aKlktgD50lKEFt/MU/jxdNUNWKyHiRK5LTO2mQXfwL+DaYwkxj+L5H?=
 =?us-ascii?Q?76T9m2ImhGCyJ8VR15uRu56la6Jgh2ZOD/nxkahsUCx5+1iJFqkyQZiU7N2j?=
 =?us-ascii?Q?1YmAefqAaxJ2rfh6GEWzJ2SEXAj/vS2VtD5IywnnuVFSPEOrK5gRGUtpkABs?=
 =?us-ascii?Q?Y0arpBpc8VMoU0q0x8Ojsh1umwb1Qdh8rQ0ItYbB2CV0ScaPHH1+xilr3ymr?=
 =?us-ascii?Q?3H5ll5KDLeWVANHxcv7hyKSBMS5vrhS9ieyo2aWTjvxaqbucwLge8kUSSNcp?=
 =?us-ascii?Q?43GUpWvo1ULgQW/sDon7BNnRsauyDjxMbzd4bZFzAj1lPg1mbRNYHhxeNXGx?=
 =?us-ascii?Q?vLZgjzRDzFYn+rkDRrLNY8nK9U1PcUMk6Ba1E2rHvusJ0E/qwBaiof6OjrFR?=
 =?us-ascii?Q?pqPux8VfxKJLQoYO2pcNOkBaF4EVFD35gTuWIqUoTOGGJC/+dFzSRSWD4vfd?=
 =?us-ascii?Q?+0rkXa+UTEVrvN5WI5e+DE2atY+3g42mu1BnqUUPbPCrQXNdtmsGqmeu/hWP?=
 =?us-ascii?Q?DxjhRU+4lIIjtrr3OagL8GjojoJdoUU5kUXEXOT0g/m57Qq+9NLTlNoFL+xD?=
 =?us-ascii?Q?RI/IYF9vRlgNYoq++4b7c7btsFGc2d6/wZin9a70PspJIjgChYCaun5S9Y4Y?=
 =?us-ascii?Q?rmV9sTuC0iJWIJWVw5SKE/7+d7dYzeuSJjCaywe7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7e1478-3fca-4fb6-e13b-08dd8627fe10
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:40:48.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gx63clK6d9BmJwOVFroxSewi7Ji+I1Mzf/VUcDe8CD+7wXf55rQehOSgZf4IyVGoECd7MoYjVTeJldrT0Z2YHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470

V2 version just change commit message, no functional change.

In [1] Bingbu report an error that vmap_udmabuf invoke failed due to use
vmap_pfn and blocked by !pfn_valid.

Due to misunderstand it, I change vmap_pfn check of !pfn_valid to
pfn_valid, then send [2], then Christoph point that:
  vmap_pfn is entirely for memory not backed by pages or folios,
  i.e. PCIe BARs and similar memory.  This must not be mixed with proper
  folio backed memory.

So, I given a misuse of vmap_pfn. But to fix vmap_udmabuf, and consider
HVO effect, I offer a RFC patchset [3], which simple copy vmap_pfn to
vmap_udmabuf, other implement folio range based vmap.

But in [3], Muchun point that I misunderstand HVO, which do not
released any page struct pointer in vmemmap, only change this VA's PTE
point to hugetlb's **HEAD** page frame, and release remainned **tail** page
frame. So any page struct pointer do exist, and folio_page, folio_pfn or
other api still can work.

By this, we can fix this error simpliy:
 Patch 1 revert this vmap_pfn misuse patch.
 Patch 2 fix missed offset page set.

ChangeLog:
  v1->v2: change Patch1's commit message which vivek suggested.

[1] https://lore.kernel.org/all/9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com/
[2] https://lore.kernel.org/all/20250312061513.1126496-1-link@vivo.com/
[3] https://lore.kernel.org/all/20250327092922.536-1-link@vivo.com/

Huan Yang (2):
  Revert "udmabuf: fix vmap_udmabuf error page set"
  udmabuf: fix vmap missed offset page

 drivers/dma-buf/Kconfig   |  1 -
 drivers/dma-buf/udmabuf.c | 23 ++++++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)


base-commit: b425262c07a6a643ebeed91046e161e20b944164
--
2.48.1


