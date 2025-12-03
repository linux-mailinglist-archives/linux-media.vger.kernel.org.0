Return-Path: <linux-media+bounces-48116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE667C9DBA4
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8966D4E54C0
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01872857F6;
	Wed,  3 Dec 2025 04:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ncuUlE5C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AA27AC5C;
	Wed,  3 Dec 2025 04:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735018; cv=fail; b=nhhIoC/S1snNiX5QVY0vR2GQEj80InUY5tVlwFDHO0uEBh31auS77/XpPJDdssbuWZz0wEx+mzUkhixiRH7G/VogCD8gHJvmYIATHXt5mw0hgUJoou0uCg14hj6VDhDPfYws5oTa4zVdspAtuuEYfFMjWq24SaaDZgCxI2Texa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735018; c=relaxed/simple;
	bh=M5FBwRPP6dj6RJ3pWJgzMyuTzbJ7mgEsEdvpO1kS+2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kv7Ywf7HKKkY7fBAa5941nQzPS47RbhMCUD4pSQRogJ5S9blD5cV02o1dBYNi3yPZgrVjPA/ttjF3Mn4lCORZYa7ch4eO4WV/8voFdNlmyCWcDAlIRYFEND8AuOelAZ8Udg8Qs3OAPMQizDCPJeGJC+jZkPMsj1h+qb4HPTu1aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ncuUlE5C; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B32opGd2307635;
	Wed, 3 Dec 2025 04:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tu5GMeYnDYEvC2h7nHTnCwk5l7ZuFnLfN3QMSxgrBYE=; b=
	ncuUlE5Cyps+FIwk4ZGtTVyDbyhxvAT+tC1vn8BArJkN4YI61xRQPd56Ckg3padZ
	gTnCjHv5jNZ0tYNerhoFeaB1FdZ14x3uD0O4AGlkK5YVtFNRkBC6QLhATdQH83Lz
	Fr9cfElQ/qcL89aMkr6DW/gZYRAstb5GDgosMRMztPoQ9SqAli3kUr0TVhEK7N5I
	GSmspZtOzBlX5liNYdEkuFX336cbi+WaO2AVa3G4j2rtRc2hxCg85nTrmBOhaRgW
	aAibtQ0Bs/+R8rQSy8gVH/gviUSOlORL2gKo2eeSLzf62I6imaGS66KyF2nSLnkf
	rr1iMnSGZ9q7kIZWTb9PSA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6c95g-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 04:09:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XspE9YYb3ULq0rycs9s4vYoHXRNyP+2Asjxr3/AJXIBi0Gr4NKpwT0vjUuF0sUUDTeYebaDuOanKPEjVYnKVm6yI74qGKmjf3YHXOl3GyDuzpUEqZdAQL5DkF9nj9dXJ2qedS8bGFwXTMmgc58HpHcCrwPwZ/zKZ3uv6uuH1uEV8CioN+f65SlU01Y23SXBFcLibY7qf3UgI5TOSoMTm19WYXmBkwYl4JsMgqSTjl178qMtOEndZoXRX+rO9l/SqAXqXc5BQ3VniGoZqiTs6vgabHozctxSsgGGt2r2xJJPvBacj3WnPveqJ3MVcxpY/of4bbz3NHeTYMgZh7Nv/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu5GMeYnDYEvC2h7nHTnCwk5l7ZuFnLfN3QMSxgrBYE=;
 b=mAQzzKPL7SzaZN9rdT8Nf+to5UIVghY2ghVyo1erQ51sem2eiBDbyvN7e+EgWH4lm0xGkhu4mA8UIW0ouDmBjn4s5/B8r9BD89FQCCgB1dxY792+OQT0DXCYrDaYufTYVIsGtwlNvk96IDG2oHkg0zYvNUSTQUn09CFoVGsCDV/Vql5ZCivk4+onV2y7+tEH8l4YtcUv9b+TS56a3DXM7BOOjteJD/SehlxCNqQuDP0J7xR3QTATNk97j6Litf/xjYnHwz9RHhhuwiRKZZndM+hFne3k0t1/+6iV2HK8bijGcEATnTWoY91t5JkvaPkwSZgZ5bEJrq8ahbHCbxvIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 04:09:49 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:09:49 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        xulin.sun@windriver.com
Subject: [PATCH 1/3] media: wave5: Fix PM runtime usage count underflow
Date: Wed,  3 Dec 2025 12:09:33 +0800
Message-ID: <20251203040935.2685490-2-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251203040935.2685490-1-xulin.sun@windriver.com>
References: <20251203040935.2685490-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: ba452579-e82a-4bb9-4a0c-08de3221cd1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/6jomT6cFDXerFtSBPqf/hnz/k1uB0VVoqUvWFNGmXIVaQro4+yMhKNi2kkO?=
 =?us-ascii?Q?p/FtkEolp1f9FImIj93FQ6MBJMrmcXgtQHcKCXRBMhaCZRNco0+IyTWCait+?=
 =?us-ascii?Q?W7qgtoXELMNhLKnfWAkHRSwIiQogrOS2XHm2dl2MbqMT+xaQqcDAHUU1TBYx?=
 =?us-ascii?Q?ITFOjq715ymyU06D/u415zjbsSnxreq857NX2U8Ru/U+T1Od+ULrMthDZi9b?=
 =?us-ascii?Q?CB9vrJBK9U+mNLEWqqlgn5lgYs6g3ZwZClQx928UQnjdXiyt8DobjjNx+Nv2?=
 =?us-ascii?Q?fYi9vAIk8Rv1/8xvs2h5idE3K8X2G9sgg7LMRRG9vyG7cT7r+22xXca+RLXe?=
 =?us-ascii?Q?OFrwDNwn/Jvhz285BEYOzdEX+A3QuS9Qw49+z4b57HqKa6bydy74kUjrjJvT?=
 =?us-ascii?Q?kcfv0rxVUYYqWmL9hHmVzDDeNqJrqZXDBK7pnBDMjxATXXU1RDanSYntpMEY?=
 =?us-ascii?Q?1oFnqlX1XLvRhihfi1yNSuzAMqwAi3+8dVt0ruoQVOkCnH7cdj65CnKgifbK?=
 =?us-ascii?Q?6SnPiCZwPOPjQvk8Y8iO/ZJ88H/JtmhnHoyhQ0GNmN7FMzEQN6k4tGNYXVs9?=
 =?us-ascii?Q?L5/U+zqo0gkg+QgQdDoH+4tpuRJMvRTciQz1NZcCi7VcZdCnNjmBsHxJ2HGe?=
 =?us-ascii?Q?Mc51mPiBAlytBajfIQiU1jM6aT79Z9Pm8i4HbnIRTdon7TtykejKbh024jBK?=
 =?us-ascii?Q?91tFHHJvt0ovZmXdiWOLwrkno7pJ62fkIFLJY/QCcxuNckbqmDajqWSvAWkr?=
 =?us-ascii?Q?KlmxcuqSQBI4nRqG7JclC6FWqyB2FwDO2EqPAVC/FjvAlD+gnSToZKRHyW3r?=
 =?us-ascii?Q?ye4jkMc5/U/EZoEtm+Xr0bwQj//SegN8t8lhDVJ4JvOYbtLnOuUzml4R4pRw?=
 =?us-ascii?Q?B35YTFrvZ6iidGUUzM8KfKC7QpzHsR+KhaCp+jAuNpLkBK/jmxyp8JThW2Wa?=
 =?us-ascii?Q?uJpbdQdJQaVc1OVVUNP2/Q1fw/0vTTpkhFwNm8WkZUOiYv1xUiHMOyQQCvgT?=
 =?us-ascii?Q?Mc+ZAuyZmBFm/lZ0p6bSxp+GBZnZtBBf7cN3KhDaK7jrTZ04wA71EhAWP6bC?=
 =?us-ascii?Q?2m3jUB1+Np4AI1SdMrPuWVOyUgYkkpZYubGt4bofo/Ecfwdi7rJW73UhLqBx?=
 =?us-ascii?Q?DipMGVWS86+uFHUW6ubidtmJsZ1Kob+3rAq0TKcKH+eqlSE0f81W2uJWpDp1?=
 =?us-ascii?Q?OEOjmHT/pV9QHnhd5MWpAXi+UNPitgMu8GD3dJbMcQPkE1zDl/2rDSVo6sUi?=
 =?us-ascii?Q?SVCykTRLyhaW2Ylg6bgsMSAjcJu9mwds5HZtnudn0ZzaQsC1p2tEd/W9C/3v?=
 =?us-ascii?Q?jr2HrrkoeJZdBYTGWlyCmYBn0XN0xmPOK8l9Q1hJvNPjZsXI+D651BQvKjNi?=
 =?us-ascii?Q?WfYhnUByhzOsGSYN2Rtt7VrVq7FEm4WCuhFuUo3f7G5qGW+arTAsXH7XdrBU?=
 =?us-ascii?Q?3YKCTI2q+Ex0KUGQpvJ7goaEfQO/GZ1ZmgSmCacW7Vej1RKrdBpBwmZQgVFo?=
 =?us-ascii?Q?terIqbe5lCTwa27dGmf/UTzgqULj4v1YtSjk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5s43blbeUijFF2wkx+yRQwTXEg+pqbXPx4Jr9jX2Z1Osd3JDa2uiEIgJ5CAg?=
 =?us-ascii?Q?TcJ7jQn/+ueP+nPUAuyXJ6tgZArEii39REikQ9GIEjV0PGS0880+X2Ap3Ttk?=
 =?us-ascii?Q?VnuKQjyIKKGxlYI1CjZMm3TPZPlweTqZUkp71d3uFdKD3eSIE+PBFX9razHo?=
 =?us-ascii?Q?KpDqUoo/wrjhjq9m1UWuVGL6tigp0ypLAPmTunRSaXiwclxL6ttzdl+711xc?=
 =?us-ascii?Q?ULWotpptsDLCMT6VT9RCZ1V3pRtbxlx/II1JfQKzvE2AKdcUQkUuEhUXOb8C?=
 =?us-ascii?Q?ik7pRDWvP0KAtVPKjcOp745f/sijFKKdPbM7otenbCUxI4e1Z+HLpces7VXk?=
 =?us-ascii?Q?byUsBppUhRw/VCo25qfyNkapFIkfZ3CkMm9C+oAQ6uMDt9Prj3tG4lmSeAqU?=
 =?us-ascii?Q?BSZQwempubeFvPsXxlP1Rj487hhSzfgseECvCk0GbjuTxKm8azyqmWlK7c4F?=
 =?us-ascii?Q?g0iYgSgabaYzHOkw4V7/ml2dbbfzMhNl1LTkMkz2tekOYDh7hla7WIDXhbSF?=
 =?us-ascii?Q?TO5ZoH2oi8xdF8EmXzvGxAWXMcfJ9xI/9yOGQIv6xOoYgt4pMYZSX5XHSY5L?=
 =?us-ascii?Q?xWQT5EXMpC0VJSs5l/AKMPu3a/Xp1qo1MRfZSYwiiPTK6frSfeKk4jbX7crJ?=
 =?us-ascii?Q?tvSvVUFhYLw9pbq6+dAC82YxJn6PIQExqGZqdx3hVYa1rtPaCHXZdSXSlByp?=
 =?us-ascii?Q?mlenD6ibl/BVxRJhMIg3Q8u9KjpRQAqa1njA2pMBX/Xqxxm2oKLLjaTiW1JT?=
 =?us-ascii?Q?4CZ+icEVfSv7LOmrtBBD1P0Ty5119yKzQhME2YybuKfsgSWJ0G19QDqh/uBE?=
 =?us-ascii?Q?HgVfAfA4Kjz9Lmn6iPqrVyHNvLgkIn+9R1pRU9l1+RJ8yWRqOcF6FsUBKuKE?=
 =?us-ascii?Q?J7LZ7Oq9opJvjiQaKddq+G4YEUNozW2+RsPqA6PyZ32432K1Qtcb+6/qOFSq?=
 =?us-ascii?Q?yOn/Sy+A0LvY7rlfZ7AhlN1eujqVQoC7VbBgPomfuM3DZ3+FxqOy+8tGbVP0?=
 =?us-ascii?Q?hswEqaBujRhDrZqguego+6BzGob8ksrdmL2Z/aNb27ql/htuhBWEQLWUOgr7?=
 =?us-ascii?Q?SWC7eAmq6RRIi6JH9iwoajMIwodLwTk2BoDGs+s1XSXaUXYHmVqsIjIzOzDv?=
 =?us-ascii?Q?2njgoTP8A77xX8s5ueaaKYqYycMYwHLBq8s5Y9anJ/ndxBiGOcL0jiAy4qNN?=
 =?us-ascii?Q?j4iAbNTjikaJzwC4sMlFKTE4n6FaE4jsP3+q/1bmYeoe65N8gwcIYxyF1wwO?=
 =?us-ascii?Q?SN0A9pc3opNiWtdaRkVd5HS1fkwg/UEUxP8G9KQcBJWpQ/ZmBq205LTOEOUj?=
 =?us-ascii?Q?dQ1afWYDqr7W5IKe0Qc05gyEfKWfgNYbGxgurEIPiPkeTBlAsjZnfOjEXKOi?=
 =?us-ascii?Q?G9+JRz/B5H1BmOyuGQGXyCUb72LPXqqLv3P+wKUJKKdX9S/0YwcisKXed+J2?=
 =?us-ascii?Q?OtoHNF45A3udivqwrrKyjFM8mprUYhqfV8WeKLyYLPaFY0vRR7NIAsb9yx4J?=
 =?us-ascii?Q?nk317IKQwYBA5j6y6GB5v7RFJyO1aQ9WpcNBe6JZ2HsBN5d4Pzh5gJ3X5kew?=
 =?us-ascii?Q?mG6L29ij5Yr6VXFPb3zPZ3nI6AkcjtWSpmPP1UIZKgHbn1qx14xaHhTHfFZv?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba452579-e82a-4bb9-4a0c-08de3221cd1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:09:49.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPJtwFWL8nVuRkuyGtpiRGGQQJskK1ApHyBgdbMnVuB/VpzPJALmgGEUQOgxbYjzkWIHo/M+JHIE9DPQzKb7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMCBTYWx0ZWRfX+SaYGpOUJELp
 f1QV9J3nkZvUYHjhm+jvN1DzfNFJ/x642+idU2pn0BTw6ACTEWKSNEr4A/45Bo3dbalvwFJ1CJT
 ygK2nC5RPWPitWdU9U6l+2+ZT4d67fDx1EvV2dYxexmPPFur4oUjSltIFT/ZRFEfNP3VXcmbwlC
 oHE0pBqlhvfniV2/drkL429P6K70Rg/guQXPiYU8/oeITgG7fWLGzZq/lGHnxUwWSn7sUsJnKMv
 mgOnFKGhDvFfTBlSJfTTISSHQQYF5hJq1Zg2n5aoV3vFXVSzlqwFCE+eQkSTnV7EXUtHp2E4CLf
 kYsb9CeLFFYOsp2KG2LAp0KEAiNt833gHGXary5sQRhwhLF4uuY8UVWwk2qc/rWEEI8thyrxXpG
 uZqH7r8BWcb75PoBq6MHHdJZ/tTn7g==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692fb80f cx=c_pps
 a=/jEiNo7mPoItVXs2NspnyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=UZoUXlwP2lSECv3TMqQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BdlDr-oTR4rjAhOSN01xcnduykO82Rjc
X-Proofpoint-GUID: BdlDr-oTR4rjAhOSN01xcnduykO82Rjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030030

Symptom:
  ------------[ cut here ]------------
  WARNING: CPU: 1 PID: 963 at kernel/kthread.c:1430 kthread_destroy_worker+0x84/0x98
  ...
  vdec 30210000.video-codec: Runtime PM usage count underflow!

Root cause:
  The driver calls pm_runtime_put_sync() unconditionally in remove, but
  the device may already be suspended due to autosuspend configured in
  probe. When autosuspend has already suspended the device, the usage
  count is 0, and pm_runtime_put_sync() decrements it to -1, causing
  the underflow warning.

Fix:
  Replace pm_runtime_put_sync() with pm_runtime_dont_use_autosuspend()
  which properly pairs with pm_runtime_use_autosuspend() from probe.
  This allows pm_runtime_disable() to handle reference count cleanup
  correctly regardless of current suspend state. The disable function
  internally handles the usage count properly without causing underflow.

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..23aa3ab51a0e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -356,7 +356,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	mutex_destroy(&dev->dev_lock);
-- 
2.49.1


