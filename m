Return-Path: <linux-media+bounces-53008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KUPHvMDlWlbKAIAu9opvQ
	(envelope-from <linux-media+bounces-53008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:12:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1715221D
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FAFB3026322
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C7E19F121;
	Wed, 18 Feb 2026 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nfgp29aw"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68ED1E570D
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373533; cv=fail; b=AHtHpLEmBG4oIRXPrgvSTjyMImlHENltQnDMXCkwchGG+eqL8fGaSD+T33SWgzHCk1CWBTTM80P3P2j2EQldwMz3a5NCiWNxFXZirevAwC1Vsq8un8S+GRiiETB5GeADEiYnSfquAyS/GAsWnRYg1tFMZ6zu//gMff4Tej5vGww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373533; c=relaxed/simple;
	bh=GiQ5J3RImXMUZQKCLCwtmW5VtlLFHDxSDl+9Esztylw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hz4xCoGukIKiOlkoju4JOJDScheBBoA7kwdAF5K9x/9GoZlIv7/uQ0f7bTUTiVUx1mekqxkDp22VWUuw2lWdeoJwVqWhrQuWD9XbVpSlRbim4Ec8cmyUv78iCmOvAx1w4h/CpmO2qAY0UA8S+ijJMY0U5M4sy5Qncv6zxPGVUNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nfgp29aw; arc=fail smtp.client-ip=52.101.193.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPaVCzqf65Rvi4djQCvWB1bkaX7QsA8FhWpk1dy9pQj+tAivkR+2o3nG9gQq0uCoDmpUjFIMdCV960rTow2jQUddznL3WAT9iK1qB/3TdKNYd5UF1Q+xeBXpdXRd8oIGh52Mk/Q82PQVd4ZhhTC7BzSCToW8t0hm2VWTQX4FXVs04VuAfD9S0Xr4wb8nwSkbxkD7aoZJzAG/kw+fhCgP6ZVctjlFM1CyGWMH3vKfaM3+u7Y4ZwZHmZWP+Ql5Z/RwNu+eG0WmcYHgmAHkq8s+78G73suEZ6FivRTVIA1YIR9sJYoeYcJIBu8DIb2hLfCoTdd7Ke6F0Vlr8AwRZeoRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR2QlK/6PkchkvOVeUxzq193rxk0Gx+tMfBlgNvsIGU=;
 b=d4WTLT73pzlSGY0hTTZVqi7Tw5/AUCrga0/QboxanYAB9RsAsd4U7MIzlB6GM58Dwu245RynuPEF5T3YHDGbwVE0h5vKzFpnM/lm9jIICGcwDSfpIvd8LA+efXWIm55g6n2BgxS+ZGNLKMs6ktiGnpbnqU7mmvlSD67g6n5C59rJ84v8atEotjZzB49whX4gzliU7A5VcXRhc9jIlY9TvFIH+o9LjWyzcDu+kxkLKcLiMNgEmmFIqoR+X6zrtT1ij4KA/TeeOsKUqlxmLfa8Bn7DmCWU+yWJbURvek5QvZd0EVMlkxQk3mUfOBK7p1wdnjW/0gmszA49rHr24XhXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR2QlK/6PkchkvOVeUxzq193rxk0Gx+tMfBlgNvsIGU=;
 b=nfgp29awryb2HTH22OXbkYu4sx7BWHWmuw0k2A3Vs/02ehyvvdeg5HLa8d5JrR1z+DGVQYC3GjEeP5Tnx51AUwdlaZayYaS99BfzvFUz6NRDGKHWi8uMxdXhrk/aBZScFkOzd9J8h6LgWCfaGK+sfqY34kP0XKtpvSwpeymLyqRHsnWT7pYemLh7Kcvjo7yRJbfGagajm82CVV+TAazo67kbl4IMPZYaEPm2qj9IPlulrqpECRElwAX6alC7IezG3kKfKyU1GHKOrpwRHn2jto8w1Os+XTu/KgsGgqAIDEGVKbQYaVig1cDKHXkgws9bUpmKkgQD3oO3462MpEA5xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:05 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To:
Cc: Christian Koenig <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 20/26] treewide: Rename dma_buf_dynamic_attach() to dma_buf_sgt_dynamic_attach()
Date: Tue, 17 Feb 2026 20:11:51 -0400
Message-ID: <20-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b25d620-3dab-4a69-bea8-08de6e825643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cH/zsr3rBKXYy2cXgpWQMRgqnf/xTdO+ZydhGyP64wv/Kn3FiZUgZAgcEGow?=
 =?us-ascii?Q?1DGDq7si0xOjj0C61YDUWC3sqz0KOAgx7Nlt/a4TPfS3xac2I1kGsggiyGSP?=
 =?us-ascii?Q?0TFmmNhilJl3pV9SdNCds6Pa4yQVTZFzBjWSlIigVwrBSi4APefGghX5cf7r?=
 =?us-ascii?Q?K7b9sCSBh0L/bOdxTQFHNlNNcxj7WVv5mpYgnIRryZ7sXswkd2LhqUnYvs5S?=
 =?us-ascii?Q?tow0H/gPw+pveeEeJpZpV9us5Jl6yrJnkUA6MZbpSUaZ0x3a3qO14LgnZgt3?=
 =?us-ascii?Q?g2p2wHlPJL2mAb9mqd479l2oiRQuq36xi/d4plZ63enH2tbCnIQC2zb4iTT7?=
 =?us-ascii?Q?5zrxNMgGb14Qw5ukCbjmkZSM8kll8Zrif/tLVUNeG6LkcElpVLpUOjgWu5vD?=
 =?us-ascii?Q?L+SuxJqI5TWOlbSilRT/0cTZT+z0fRYGdDpKGxxlimOPNsHBWLuilkos2zPu?=
 =?us-ascii?Q?StiX3c4vZZnbaPHnqMVpH2xGRMbc90zgtvJEgd8s55XurbNR6YsMGGW/lS7w?=
 =?us-ascii?Q?sPNLkvn/2gdMVLhyICgm7+U/5Q1TKPzHGOmaGyS7ttgd+7Bl/LkdJqbik9eS?=
 =?us-ascii?Q?3XevtFZjwObPoZaSvQVnCFen6s/n5xPRBjb6bk6Ssd2FPPqp273qVUkQWX3W?=
 =?us-ascii?Q?yjmoM9LJToQUkkdyErjV6PcXITr86UprEoWNBdbuF+I4BC4U3V5UGh/JzjXp?=
 =?us-ascii?Q?CoTvsFZdZ24CefyOcn2ZPy0AdNN8D313WOZgNNALqbYK8H7OuzF5a5elVHJC?=
 =?us-ascii?Q?zuh79bxihCwZyUj+/JfnnjiixwArVVcAm5ZlDsdxglwNwxr0mpMaH4h4mMlA?=
 =?us-ascii?Q?yDy2ockiVPm6tDBAw6qtPK7qfZ0wPYITWcDy4e7j4W86RtZlmFworx9i7VWU?=
 =?us-ascii?Q?lT402q0HlAn6ahGiXbndf+ULB4dHsr72hankt7m78CO3JOeceStWyb1/Ya4c?=
 =?us-ascii?Q?fL9wQQv4udOQpe+TM1HY95sA0PNtLTeXf/YOKxY7fEJAcPoaRBb0uX5dVa6g?=
 =?us-ascii?Q?bHWsm534cR7vfH1sjC7EVw9nNfaSvwnmJPOaXN3NUAIzRL0+Xd0ODQEDf0h6?=
 =?us-ascii?Q?tVtMoYz7j80F8xiWzY4lnmYpHWuO93GkPQGfob/nAgW4zZ+6s1zbs0CeYE69?=
 =?us-ascii?Q?qe75uhEaIfyKHsALEcXs/fPAnNciJwe044UDB7tKLN2IEWQOTKSXTDbaLQ9V?=
 =?us-ascii?Q?pwgk3s3IuhMMEl+hllOAnZEUYQaWaagA/b9jPm5cyuW7BB1koDusdqFIm6XV?=
 =?us-ascii?Q?Tc7DCsqYG/DFWF7jhhGKTdbfQd7p41WcUHHsFjNVlYBlF8cfiuXRFjKmk+ga?=
 =?us-ascii?Q?Lmgzux7oGHh+s7kB9Lz698FZRUDFf3pZb7XB9tX3M6g8Iz00PIhf3dU0YRXA?=
 =?us-ascii?Q?g4umuO6daTUH4g2hqKzfou4IAcXeWWVtEzDgnM2DN+DTlvh8IYBxLje7Fnsa?=
 =?us-ascii?Q?ymVwwmS5c89ivUuoJSWFCBWYj9/1Bw+Zw8gQMcExG+H3iaUqpypH7Y2zXC1e?=
 =?us-ascii?Q?Je9HTb5bhloZrByClWXVWZToI/D73NtvFR7XG9Aml0ou9vw3Rpu4WWDfCMJl?=
 =?us-ascii?Q?Jxxfr4X5qMHLUFVTwCw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dkiTlhGp8hvJgO9mqbkzDwsR96d0j8xmPdAcOiPMaWVDj4IQg6tnWPCUvKPL?=
 =?us-ascii?Q?tNk5zEGzJj/3Q+n0IbXVdB0brldAAbJ3YtYja/bcqn5kTUoYlhZ13d+ofm37?=
 =?us-ascii?Q?Kw4rMmOele1rWmHLfgUgXp8CkN3TakU820vnWpgiUwy5u3JiqDN5ARJigHnF?=
 =?us-ascii?Q?Y7HHZLdF9qWKbmb6HaBJr3UD6ptWzu18gfZBJQ1JcUDtlsV+LSjdh+K6anfF?=
 =?us-ascii?Q?68EaBCA6kT1xKxa+rJlBWwtW5eakElZpbolwB6qw1lD/7bVOAtjdjs4WFi3N?=
 =?us-ascii?Q?Ny99t+uMS138PKG7qnaL+Y2cOYOVfldTJljGNHtn+ygbew5qAuy/V1/LjiOd?=
 =?us-ascii?Q?VeIyWKHM1Zau+jwGww3jyz3WgU60xK60nI/pqFRmOtnjikPnfixUyfVLY6zp?=
 =?us-ascii?Q?9hUd0BC+Yh21hMWWUTDYz2jzoaeuU2O4G5BbYQ3rg12GufORWKuXUZNM7bC5?=
 =?us-ascii?Q?lEOrpfwNNEDz+a3wUlnGrqVX3WkYo0waGo7WsehN9bRzet/TiHPfFGG3Imee?=
 =?us-ascii?Q?f+vOeVqfc75jNYShgOz2QnotwH80I3AQ3CC8BuDk1a+2FlrSOkQtTfWi8WCH?=
 =?us-ascii?Q?lI9QVnvT9wAmGC8Rc8RxyLDZDoh9wxcHg/omN8ml7UfsoabINnv5qX838FhY?=
 =?us-ascii?Q?mpic7cze6nF1pgg1rFSXpmm8F39zFyvK+7NZhX7Ci+ButUVwmLZsgxNeXlo5?=
 =?us-ascii?Q?8n4rNxEnQm1HwY+Q/DOdUyUEswONQh3YUmhK7JDUaCDwkdluchAcoy9AGU8j?=
 =?us-ascii?Q?I8m5AcDIlndk5rS8bLiXK+yqENuXf1RleUF3Y7Nv7A1JjjwSAx9OqpSohdXK?=
 =?us-ascii?Q?Pm/4UoxKU9Ioi2+titkacJSyyQezl/hhTB14/Aff98yjH06Rhzlri5xjOQ+c?=
 =?us-ascii?Q?pIA3xRNjlzRRVOaexZossXz0SJcEOpBex9kI9wNKr+zSaMF7le5thDERUhUD?=
 =?us-ascii?Q?YtE8fcic3+S0kbDH+UlMR/Q582gmE4Ae1wPaEinZgOXgcZeYYTNrecyXo5T6?=
 =?us-ascii?Q?n0MK9+rfLTqA9Ekd5U5wujJ7ajh/58A5GCxLrWt4VdrFMDEM4c0bpqEuA+I6?=
 =?us-ascii?Q?QUkLLxaRmuB6MZTsos2WF5XW1Bmk2Zx4PFRYHhSK9WbnlnVXnjQQQepYA8Ep?=
 =?us-ascii?Q?NE4A1EYaaJmi4W7X/xks7Xs5fgDFPhFoIHGtQD/VL5XLqLr0kuKgLvO6Rvtz?=
 =?us-ascii?Q?OBgyEBBfzIKucxlfzWJc/kpeClBvm7h4TVjbCdVKT2Q5QBTpb29nb0gNfoyD?=
 =?us-ascii?Q?AiT44bzV5GRiHBGzQ52/298NpGhfOGZWcyCCl+u2b2uYGXXymaKcgZcyxDZD?=
 =?us-ascii?Q?/1XR5z2vZbRg3FoDcyPKloATy9hVO9goiax4kVq2HE0X0n04GO1B7sOYmhvd?=
 =?us-ascii?Q?xE/Y9rmag2NieQVGKcXQa9sMJIxaz3YMSdptTbioics4EJ91F+zL6hPTBvSm?=
 =?us-ascii?Q?GJLdcS84BViTb91TPcj4OgceghZnTTd8xnzPuzhq7WvLRwjl47UhQDuEwG4u?=
 =?us-ascii?Q?Afw5VDhjp5G3HzpE2uR0xZHg74i9+TOKI4yLj/HdobrkUeYrnYnhBjg+e0EH?=
 =?us-ascii?Q?iTTM9O6KWdzKQegw4r0g5uyUFP+ALEjWTavhXeWklenRG3oZvPHXNKvcx64I?=
 =?us-ascii?Q?Sd+r7eUUIedmOPp8YliBFBiaR/kqLhhae3z6keFOZL4UxOZ6Xea98A+SOIS6?=
 =?us-ascii?Q?GO/f8ahEGF2eDiCDOS2iq3w7nq1mDCL0NHkhyZfzhwVglvqZW3EFcXezp5hS?=
 =?us-ascii?Q?p6oQyIyamA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b25d620-3dab-4a69-bea8-08de6e825643
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KygcWL9ZaKLt0nYAr5YUIEi9aaTTjSTgKk4uzJWA5tI3Ltno8rPql2MvUtTzc6GO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53008-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53A1715221D
X-Rspamd-Action: no action

This attach function always creates a SGT mapping type importer.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c                   | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_prime.c      |  4 ++--
 drivers/gpu/drm/xe/xe_dma_buf.c             |  3 ++-
 drivers/infiniband/core/umem_dmabuf.c       |  7 ++-----
 drivers/iommu/iommufd/pages.c               |  5 +++--
 include/linux/dma-buf.h                     |  6 +++---
 7 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ded9331a493c36..cfb64d27c1a628 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -876,7 +876,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  *    functions:
  *
  *     - dma_buf_sgt_attach()
- *     - dma_buf_dynamic_attach()
+ *     - dma_buf_sgt_dynamic_attach()
  *     - dma_buf_detach()
  *     - dma_buf_export()
  *     - dma_buf_fd()
@@ -1019,7 +1019,7 @@ struct dma_buf_attachment *dma_buf_sgt_attach(struct dma_buf *dmabuf,
 EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_attach, "DMA_BUF");
 
 /**
- * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
+ * dma_buf_sgt_dynamic_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
  * @importer_ops:	[in]	importer operations for the attachment
@@ -1028,9 +1028,9 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_attach, "DMA_BUF");
  * Wrapper to call dma_buf_mapping_attach() for drivers which only support SGT.
  */
 struct dma_buf_attachment *
-dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
-		       const struct dma_buf_attach_ops *importer_ops,
-		       void *importer_priv)
+dma_buf_sgt_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+			   const struct dma_buf_attach_ops *importer_ops,
+			   void *importer_priv)
 {
 	struct dma_buf_mapping_match sgt_match[] = {
 		DMA_BUF_IMAPPING_SGT(dev, importer_ops->allow_peer2peer ?
@@ -1041,7 +1041,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	return dma_buf_mapping_attach(dmabuf, sgt_match, ARRAY_SIZE(sgt_match),
 				      importer_ops, importer_priv);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_dynamic_attach, "DMA_BUF");
 
 /**
  * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
@@ -1072,7 +1072,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
  * dma_buf_pin - Lock down the DMA-buf
  * @attach:	[in]	attachment which should be pinned
  *
- * Only dynamic importers (who set up @attach with dma_buf_dynamic_attach()) may
+ * Only dynamic importers (who set up @attach with dma_buf_sgt_dynamic_attach()) may
  * call this, and only for limited use cases like scanout and not for temporary
  * pin operations. It is not permitted to allow userspace to pin arbitrary
  * amounts of buffers through this interface.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index bb9c602c061dc3..8169ebe6ababf1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -586,8 +586,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 	if (IS_ERR(obj))
 		return obj;
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
-					&amdgpu_dma_buf_attach_ops, obj);
+	attach = dma_buf_sgt_dynamic_attach(dma_buf, dev->dev,
+					    &amdgpu_dma_buf_attach_ops, obj);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 95582cfbd7e63f..7e9a42eaa96f4e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -327,8 +327,8 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 	obj->funcs = &virtgpu_gem_dma_buf_funcs;
 	drm_gem_private_object_init(dev, obj, buf->size);
 
-	attach = dma_buf_dynamic_attach(buf, dev->dev,
-					&virtgpu_dma_buf_attach_ops, obj);
+	attach = dma_buf_sgt_dynamic_attach(buf, dev->dev,
+					    &virtgpu_dma_buf_attach_ops, obj);
 	if (IS_ERR(attach)) {
 		kfree(bo);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 848532aca432db..ddd865ae0522ca 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -358,7 +358,8 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		attach_ops = test->attach_ops;
 #endif
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
+	attach = dma_buf_sgt_dynamic_attach(dma_buf, dev->dev, attach_ops,
+					    &bo->ttm.base);
 	if (IS_ERR(attach)) {
 		obj = ERR_CAST(attach);
 		goto out_err;
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index 8401cd31763aa4..c8785f6c08a3bd 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -155,11 +155,8 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
 	if (!ib_umem_num_pages(umem))
 		goto out_free_umem;
 
-	umem_dmabuf->attach = dma_buf_dynamic_attach(
-					dmabuf,
-					dma_device,
-					ops,
-					umem_dmabuf);
+	umem_dmabuf->attach = dma_buf_sgt_dynamic_attach(dmabuf, dma_device,
+							 ops, umem_dmabuf);
 	if (IS_ERR(umem_dmabuf->attach)) {
 		ret = ERR_CAST(umem_dmabuf->attach);
 		goto out_free_umem;
diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index dbe51ecb9a20f8..a487d93dacadab 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1486,8 +1486,9 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	struct dma_buf_attachment *attach;
 	int rc;
 
-	attach = dma_buf_dynamic_attach(dmabuf, iommufd_global_device(),
-					&iopt_dmabuf_attach_revoke_ops, pages);
+	attach = dma_buf_sgt_dynamic_attach(dmabuf, iommufd_global_device(),
+					    &iopt_dmabuf_attach_revoke_ops,
+					    pages);
 	if (IS_ERR(attach))
 		return PTR_ERR(attach);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 456ed5767c05eb..11488b1e6936cf 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -561,9 +561,9 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 struct dma_buf_attachment *dma_buf_sgt_attach(struct dma_buf *dmabuf,
 					      struct device *dev);
 struct dma_buf_attachment *
-dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
-		       const struct dma_buf_attach_ops *importer_ops,
-		       void *importer_priv);
+dma_buf_sgt_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+			   const struct dma_buf_attach_ops *importer_ops,
+			   void *importer_priv);
 struct dma_buf_attachment *dma_buf_mapping_attach(
 	struct dma_buf *dmabuf, struct dma_buf_mapping_match *importer_matches,
 	size_t match_len, const struct dma_buf_attach_ops *importer_ops,
-- 
2.43.0


