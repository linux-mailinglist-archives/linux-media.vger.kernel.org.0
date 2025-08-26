Return-Path: <linux-media+bounces-41087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E7B36D4F
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 17:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55835983079
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058EC1D61BC;
	Tue, 26 Aug 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ejJjvWjq"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012045.outbound.protection.outlook.com [52.101.126.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3217C91;
	Tue, 26 Aug 2025 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219883; cv=fail; b=ChrLyHRkW4T8tSO5FvBXHVoxEAO96rm8W/zzi+Xqv3GAxxPWgtK/znokKFR59HulkQMwfmtckoT1J8EMqjC2TuWCuhwZWsQx9KXm3bO9qHuJatQhT7J2ox8L+uRnhYQw5KXWZ3h9kXNlWc/t2G5DPmbSThuTGtQ6tSn9Z9uLlDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219883; c=relaxed/simple;
	bh=ak2qpANl3f9VQgnwAVidh8f2KgOgfZs5v8fFLwr9iRA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=m4rkgkG0kOxxiTzlYea6VqNDrzsh+g/u1Wjg3QqG5OxINUNBxF+jnomKo1LajqAlPN0VTwJSazXzKF1uHunReJn4Pxdkk0V168Kiw4wWlbI3wBMPuD9V2RM9oA0qpAkgBYrp16b3993K14sh3yxU40jsx5jRZBVYeNuwByVW+G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ejJjvWjq; arc=fail smtp.client-ip=52.101.126.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCRu5Nn3gc2kk8ZYdoc8gbqpLY0CwJ12k7ErgeDfXk60lwYBoQjdaD5SxHkVFRSpTWKn3pFM6ivcXan6+ivLH/9SRXGV87Cef7QYkAMTiJy3pNFIqtj9ffzYa08gQGXnfq2XmB2FWiVDARip7Nl7xdCuFLwc8amvzet5UK85i3gRckyx2scGdRveiR/7MH8zIxJ6FxIXTkS+iHHT8oGdPRDxlrGEos7+GNgZIsMwk805Oxgilvqus72qzOmPPcLMYuwabRkdxebFT/XLLrIrcj492jroS4/S/pvGfMRHCUgPyO4rRvqB1A8j/BKfiCGiyYDHPTkwAnYK/5N93AcecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+E7uEpyJw2ZBn3ZnpLH14G3Kv6f/dXJddiXyZ2UbO0=;
 b=COjwhNyXJIhSRIHQ4kejnmdh2717s/f9iiehk8sS1ikxtlSb8vvFkWfBRlXC3Zjvhsy5RXyMwIAo2dUj8ybjzBTLofm8Uymu0OxyUlyjzGYEorq15JbKscW/M/vBZfzUvSXXN18CKEjtWg60mET6hMb6lpF4ySaFCwRjL1V2+H4PLs5xbtiiu67IPAIlOYZ7ZO/j2nwR/hscOxzLDYzKOpCdDTO851W1iAwXWALxG2ojHI0aOwqXe7QJk8Aaj3b/2I+bmmCEU5huPHNSS9NWcX4myHG0vxtxAt6Ua68dekwJhG5fjAM8Yk8p4JZTKe9Mj/DvhVgyiiJ1MLtgYNrbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+E7uEpyJw2ZBn3ZnpLH14G3Kv6f/dXJddiXyZ2UbO0=;
 b=ejJjvWjqRC1b3lqdDBJ3HWc/wBiwX64+rhHgDK4v6pe+rdwRi3tT29vHOQALKsCAVHKG0gxvWxpPbqrIetScDnKRU7bvaGrwFDrwNbWrlGcRGS9SfMQS5OM6zcNkvV3jvnlH1PzIWsm9hF4fxzIleUI5CtmQnmyN98eSRzQZDFtTPd+7k++lHAV2lFuqom53BL8FnepN/NpS2DncVdiaaEn2GlD4//5A3D74MgPImeC9WWMuXLd6JPC92ZB7FKc4XEMpa0ugAidwmFk5/zHMnv8XMVotPC0qcWYNjniFSHWHU5fJof7hCfl9r3QLxHOHajCqBypKODC7x5d3mNGuyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6787.apcprd06.prod.outlook.com (2603:1096:400:453::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:51:17 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 14:51:10 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER),
	kernel@collabora.com (open list:SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] media: synopsys: hdmirx: media: Remove redundant ternary operators
Date: Tue, 26 Aug 2025 22:50:56 +0800
Message-Id: <20250826145057.534259-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: a516cffc-9aa5-49fc-b329-08dde4affeff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7RDXCbkt9FBZb+XnpDj6SWKhu2IYIyQiirac//GCavtcd949ezI7/qBNGdlu?=
 =?us-ascii?Q?jBhPGSY/G3VgC9AvhIuhHcz5ci1W8sKEsNuiENU4M6/mQMAXqBDBmQU2goyv?=
 =?us-ascii?Q?0HtbG5oAXsOaFCwl9/cufaUrW+0oNLMNFK3a4gsP10QuySmRFewgVcpZeM3L?=
 =?us-ascii?Q?VzEBZJZBfFWsGtAURrcbv5LdFUitHuRRl2xQJnTJPJXCB3huQ0M04gX5Gpap?=
 =?us-ascii?Q?DNdCnrq/jvSeOETMOn4ewU21CkHusV4rVbUN8sGVg2g/HJuEZw955vNTUQEN?=
 =?us-ascii?Q?dLH0kxvzMg36lsRiEwJI8TlWh3kwxOvLvVS02mVJoUJri82p5nxtFUIxVNwW?=
 =?us-ascii?Q?8uKA2R2MbvtOZ/DDsZHdVkRwPg3zakhqWayaKx/Xx8Ow8sdGIlM+8mUTRuRc?=
 =?us-ascii?Q?lz1dPlq5Rg07cy+xL73zLs053jV5Jtx6FHv6bl19IkMR0J7k6w+pn5d0CTtY?=
 =?us-ascii?Q?uJL+wV6/VLPJh/TmufZ1JVIxY+5xewpqu9T7O6E71SlzAy+5noxgw4kRWooN?=
 =?us-ascii?Q?TPVMMd5AZnsWFaFwfJGr52jHIjK+8ZO0tLsdoaAu58sWXq688NeRVSQm3Yy/?=
 =?us-ascii?Q?/ZiED6GTJXQawNMB4ezTVRXU9EV4x+8kcLwtV0ttbumTRWAIHKdJPCqZw7Ly?=
 =?us-ascii?Q?gRlbL6ztPVf/TV07vtEL0hZd+8T7M7JauqFEechLLw/+kkWFxUCY8CQ3tpyR?=
 =?us-ascii?Q?iCzG6WRvB2uM13drSJjYZSdm5TbWqD97ZUk87VPMRaMTpSheQ2jHtoP/ZBfg?=
 =?us-ascii?Q?2Mh3DarvMQZgKrrH0jocxw6NiDbXDSM1PVlSe+J2tOO9t4QRlilvdxRbka4I?=
 =?us-ascii?Q?vskziHobEcRpvmY+GFTBwa2Ck1/LFOaRJALZv+O5jTJtW+5lr5WFx4jzX3QR?=
 =?us-ascii?Q?S8+6XHOCo2+3qLHNLvBF7HWAhpfVyXXZKWr3ZWV9ueMg/AGFYYWAdRm/rv5N?=
 =?us-ascii?Q?3XVP9JyT0uEMfv8/vQgxmFk9fBsPCy5/Rd5gqTas5drpSKHeROTQyNZ6MjyO?=
 =?us-ascii?Q?xop2dWr9Ovp/irCxnAjR3SXLrd9BV46PYkw/plfFD9QvuxSjWWTtX2S4y51x?=
 =?us-ascii?Q?K4nzTqezwsYgqHJLSA2FYMrrMnDIphAz2IjzM6lcfQMZ7EXT9hmIpaqLYViL?=
 =?us-ascii?Q?T2g494UWUfL4fKxY5Xe2RWAGbXShrO84GYvL2PtWtAnqJ7SZGvXzgvHV66iZ?=
 =?us-ascii?Q?chlee0wquWFWHKrR23O8Q42FJPUp65SswTP3+z91Bvj/LCsYPlNFTwjaIyaV?=
 =?us-ascii?Q?Swu5jTgbu8guo6O4tuMooNMSa2LwHl0N5lpJFogn7aAOfPLek84gTbJRekoP?=
 =?us-ascii?Q?3qJAD2LJSWSpa2y0lis/eLkSTLK5liGfjrX7XkGx68alvtQcDCmxxVJ6ChWV?=
 =?us-ascii?Q?VPI2eWFGxoNS7qXhGI8v+NG+u56k7TcTWUjFAnRXi4Ked4pMqBOrGNPbMAQ9?=
 =?us-ascii?Q?OLUWDQUwkLRzM3FJnKbwgx2WBJpZVwLNzS5NmpKkmHELr7sMy6BUmw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cb+nGIF7/dC4opwLrgOTGXc0BgIESew6AVkrzMp+HrrdOUNrsrbsethJsf49?=
 =?us-ascii?Q?o4SpH3uVos209sTtQ1VezaJ/K3Fe0Fo+snKJWdRV3t6rJHOrnKncu0S8+JfH?=
 =?us-ascii?Q?cvENWj/zvWltcB7hE9Fpb1jgBiuJzpiIkmybaXNwLAi0ZiV4lH8lOu+nxs3g?=
 =?us-ascii?Q?lhKj/gCUEU1tQJxmZLhYFnVIZZbyQKrP4tihqG8paKETa2ruEx+HqbZ6OSKM?=
 =?us-ascii?Q?iLkNAVSPw2+vCNV9XGnsZ/NGERqlcdXInZhRWOKw0v5T1fEBLgiK9JS3XbFm?=
 =?us-ascii?Q?GcN2AbjZA0VVKgts2oxIJL5SocjwOF+6zNZdoY2ZPNJcWDq/TXUEemSucPF0?=
 =?us-ascii?Q?WfmfqxYar723wpLYT86acMFTtJ4y3UzeHSAaI94vY1vaI4qkeGr+QG7/Q7id?=
 =?us-ascii?Q?Clo/UglnPq7s8MEe3c655mJWh/IAA04aKsc/96mQslmPojw+TY2hj2WTJsW8?=
 =?us-ascii?Q?UTtqaw978hSDCXSM6TgqcVYztZBObFafNXJx3FAf5MezRmHN0KTYM/ncl14F?=
 =?us-ascii?Q?lPifCG309mi7zep7rN9cyk6JrUKMYLv00ey0RJnwPcers9H7+a95+cslyVB+?=
 =?us-ascii?Q?aekToVIUqxnjwicPaekIWjmlnwhJwuCowLe018G7BioxYqukU4LMXtmCw+qd?=
 =?us-ascii?Q?URRv98YrtXz+DrJtPw9XM5EVXbXecMjfgdB1xux2k9k8G67gdC6PMS+NrnU2?=
 =?us-ascii?Q?rZJ5iRHZOtSVwSBPwHDRivv3kEPaD6RdZY2M89XemI3S0auN3VvQ7eOoHARq?=
 =?us-ascii?Q?TxKOSjeYd3Ga75ukiCsNxX1wCbjDq5W5Tj8ws6M2EHloqSiR6DQVkvJ9LSi7?=
 =?us-ascii?Q?2bIsjmlUawqhQVMUg7suG8VLAt+tqhKixYVmqk13/u4smCKzzhyflRK0l8t5?=
 =?us-ascii?Q?xQE5lwG9EAkMAkSZiuns9ZGWwpp99weQFGpH/eSfrneYFmsw/JhWeJUNgxyH?=
 =?us-ascii?Q?Y43MRuYc1lelTlotgV/+meIN6ONlj1pHFtJejYjI1+z4o8kcosbtZxnbEiDn?=
 =?us-ascii?Q?e6d/LFv5C4cz+m6LKeIqJ/me70UcqqCaokNZ1289RFbNdPcneyrmaSSS9oyS?=
 =?us-ascii?Q?wTLmLfCer9lF33O4yfDWxQwM3wB+0bMvn3K9yP+wqXtJGhPe/NNra+qBkzao?=
 =?us-ascii?Q?j2JVGeyfrLgVmQ5HGqtLdd2YvlJDakD0CCpOp2Gp8jh6GrxTt7HzOghi0Jzn?=
 =?us-ascii?Q?byUCxcsstWT1VyBneGwi+a/4/TAenWFeaqXdB614lqykbbIogkU50W8mOnMU?=
 =?us-ascii?Q?RQeCFiUwE7mzOeSTa2qfearx/JaXvjSM8RktEBQNkGKyl3fLJHpXRK6k5/n+?=
 =?us-ascii?Q?8jxXuaotjOYopGsChFCxTevZesIBp5uGq7+/uuB5GKcbGavy1jsuYaXSC7ac?=
 =?us-ascii?Q?YwLREcCCqi3IgrLJv26AxkBGxWuOsi/Kz+8keEN5ldckA/hTXnUfQe31Y7lH?=
 =?us-ascii?Q?u3sVhdtmm7jRmCPoTIcFDYGNs+WZ02Cr/3T5rYxTGMuCtOLCkDFKjiODLz8M?=
 =?us-ascii?Q?k3XfkEFYdPDcamMozQrl/SqKatLBLio72KKaBsI5T5veidUsMGIClosOjhRu?=
 =?us-ascii?Q?SmH+C0frugJyK74v6Vc7jgnMFnIYI7Sw1lBNhZ4l?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a516cffc-9aa5-49fc-b329-08dde4affeff
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:51:10.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu0NZ2xBVzA2L+t1rN3aASaQ7Rk1ITgG/T3ANtEPj9WOvvgaI2CnE83+J5xP3Y2TD+FVnGFDnQX0EUBM+ZA4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6787

For ternary operators in the form of a ? true : false, if a itself returns
a boolean result, the ternary operator can be omitted. Remove redundant
ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b7d278b3889f..c3007e09bc9f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -237,7 +237,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 			break;
 	}
 
-	ret = (cnt >= detection_threshold) ? true : false;
+	ret = cnt >= detection_threshold;
 	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: %d\n", __func__, ret);
 
 	return ret;
-- 
2.34.1


