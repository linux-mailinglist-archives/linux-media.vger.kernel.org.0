Return-Path: <linux-media+bounces-59781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKZZKEZ38GlgTwEAu9opvQ
	(envelope-from <linux-media+bounces-59781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:00:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E12480CAC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A606309FB3D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB9C3D6CAD;
	Tue, 28 Apr 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f4WS7HjR"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD23CFF53;
	Tue, 28 Apr 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365667; cv=fail; b=gpDBlEpkzKShailQAdZkAnsm8iAxYZ2J/eiSoOgKAFqUO7M3d6sHWnMsmUpEZNgOfvNkBwijWwDyedp/gqWz6Jwn5moj7lxxidj2fEOnVbaorfO+PrTb40AYyYHG5Ark7816deJNw7lwfvK4LJTG/Go8yvwqi/A2g4s/BNafWU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365667; c=relaxed/simple;
	bh=f7Sd+jlS0mK5D1n854tMi2ZFPf52V7CBz3Qh2H3dZCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jIazntKHUpqKAPKYrHZg8K+R+ANuiAUbVZqCpjdO6SNw5CIA/cx/sHMakY3JwnqEwWwUkpCvZkVvc2JJIICDbCz58XjfsUgSQFSpvRI0o/szOB0HD39qNzZ/XDmjSiqx/mxRYfrVgOcxfs8TWW4JEhY/WsNLvcc9wLowXjZkEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f4WS7HjR; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfMhY+lFLvW4f1TXUzYMKCwUhOG0gohJM5HCNvAamer4UXHgT5Nb8Vu3fiF/EC5VybAlooujUWxpG6PiJcdkHyKogy50P6gu7IJq/ukk1dgWeCkjnLtJ5M5UGj9csQxg5jSp6w0Hvzhpr0KbzC1i1r74Vp+CI5ut+sbgjGaVs1p75y+bDEbtZew42SfALaNoO0sIM6HhU1wJnWa3eOvEjcc8KcpOmJLG9Jr20HpFIf2knSjLYhg3GmVs/KUEyTRp9/ZWztcd4WFRwAWaczgKK1z4leN71CrP5QWz0F4YIomHqNchPoQImgc2f7Nm22dUUWjT0AKSroH+34eJtQtNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN0SFXbLMB1m+JXP3yeMI/Bae8jhNBeM1Uhv1/41eKA=;
 b=QXCkQZtQGqjLYERnMwR7kuF9lif8KGzDAEya5FzpgxdYeQzDL9MeuY+o7zJncC29z5aXnN5+4EO0xzf8FBig3b67qIKEg6m0zb2QkErIfpKBCbhshO8W+d57mKLOXVgVn4hX44AWN3SgpndUoXM9rDNx1CAnJJ4q8VBThoVPhDnr+BG0QtHVHdqbixRYLgxfEtkfwty/17n70ZmodN1d+GXe7y+AxaAR5ngYsiDT7p0Od0GlhGnqk7ziIN9L+Bc9IQUQMeu+/tBskicGzcd8I2ToHSUGs+DAaJcUdminrLeOgqxO2mdhEkKYqhvkMAsDiZ6zQz9zeCKGjM0vQsD+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN0SFXbLMB1m+JXP3yeMI/Bae8jhNBeM1Uhv1/41eKA=;
 b=f4WS7HjRxy8JwpUG5fgoD9A8vktuqLIaeB6AlOVI0B73x8PuSxBj7e2HXvMI9aWV5CgKWqhiBdL7LvWPp1MTcUykrtgD+KJ+gngtgOOOBFrlu40wBhXTlHvQHltnKHgq+y7v0D6/k6oCTbTeZbibIu3W0PkC7h6yoC7IFU/yTAlQDln9FwMK7hP4SkPE0s+huAP96YdumSulCfghUZgAHsT8Z6pt6wUjlb/rx6fIObrMyTM2iFUhC+o2hLxlm64ox1IV4zpKNUAXRuA36hBh3NAguIkci2El+GJexb1d1ZnDaTkXtn4vDdwane/mpJ49PwuO/ZGA3N8FKLdq4i7AmQ==
Received: from CWLP265CA0397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::6)
 by PA1PR10MB8977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:451::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:41:00 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::91) by CWLP265CA0397.outlook.office365.com
 (2603:10a6:400:1d6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:41:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:30 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:40:58 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 28 Apr 2026 10:40:56 +0200
Subject: [PATCH 2/5] media: i2c: vd55g1: Remove spurious pad format update
 on init_state()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-vd55g4_and_fixes-v1-2-4f745a83b87e@foss.st.com>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
In-Reply-To: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PA1PR10MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 05de88f3-0442-4060-63bd-08dea501e012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H3CbnDKDJvITMWyKSbBRt0+z81la6WGItkHPUjKOcf8ZAKmDyp8clO/AXDDzs/3S7ry5h4grDkMsca0ipL1Wl2zZGiRuz2TDkq3VOhhQNHG+APhmsK+9VrztbgMouegjkhb+BjQumO9mzSnabKrg3Vv2vGl63CJq1pcITqEHWV78RVEOiFWamRa4AIvwfgtjLgE3xU3gH0xQSOaNwlrSVKxgEJqfPfLJ04jnvCXaHOqP8wirT6NgR+ow3QHeVxPJ1Baoj7qckfXPx29srWkqcTCnMzn14o8UEaeKGPG7K9o22P9l9wE+QgZ9VJDYs+AsrdCZq4rC8RfL+pIWVr3tZ4xqT2+tLsgSVUrkFwJAOM9v0B/SlI5WlmZQV2KUgWwXNokWpyaSwj5KxaoUkuFAph/GrD/bGvQ1dvl8/mh8BazEIf+Mib6WZQpMb6MzXpbebQt2u8zkPZm1T33dsqcBbKX5UDSO4Io3OV57E9hxbPIZyZ4XctRNKbmi3lVjL48DQHuOCvufNZhgVXW1ZMj7v+9qKu3mCh85piDl/sH9l4XRKbVt6csQkApqboQu1SBfM8EWcEvJTfIBN2OopwT/jtLqAEwOIuW4x1WOouYp6IcdsXTlwDkndZxJmi/YAdRj3umAeEZKlwuFLPcshKAwqvco/jXKDMZnYKSDicc9lRpa0dc6pN2ZCYgSqI0mP28hBAgoQW5S7S2EFg3JxMRp+uSZ6sgu4HcRCgvHA7wv9MYYGmNB/vimdOb7pnVCneSgQi/6bki9rCP8ED7k5nYsbg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Fh4R6sD5RdfHuCOQW/P2xEWX9GWogFXu3E3wuxLPDSryRH2vWr10ER/fgq2/5zNhmBBCGE+fYGa5F4wDqyzkcMcjFcy8yynW48AJNv55WmQ3liEENX75lfw4AL5DiVHzpyu5/1MNwups/DqE1x0TDuBDSXvGriV7drFl/j4Ltq+oeTsFMyR5wwzBA5d3SBKQB4uLqC07rY118PmDm10yIO8QDuJQZLNEOfVT1AV2j0MePoaDSxiWKDT0uQ5WOa3egNHRDo6ZqntjS1hcRYo4E3Gg0SJFp/gJhwaYxNlkdK1KkVwVnDYAgGSiTqxAOTacRnz8MRgaXgDOyeoC+04+T5xG7bm/LWO+dz8dPN6dEd+M/GTC1nTgIDAacwS3KcT/s9V/7bfEjP8xXMZxalstZ3UH5nbPLNkaCIak0fUP1upz3+1R68G87SUzfFt7xt9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:41:00.5128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05de88f3-0442-4060-63bd-08dea501e012
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8977
X-Rspamd-Queue-Id: 29E12480CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59781-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:dkim,foss.st.com:mid,st.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]

vd55g1_update_pad_fmt() is called in vd55g1_init_state(). But
vd55g1_set_pad_fmt(), called at the end of vd55g1_init_state(), also
calls vd55g1_update_pad_fmt() itself.

Enhance readability and clear confusion by only preparing the format in
vd55g1_init_state() and let vd55g1_set_pad_fmt() update it instead,
effectively calling it only 1 time instead of 2.

Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 1e9db21322e3..e44174056ace 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1366,9 +1366,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
 	else
 		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
-	vd55g1_update_pad_fmt(sensor,
-			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
-			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
+	fmt.format.code = vd55g1_get_fmt_code(sensor, code);
+	fmt.format.width = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].width;
+	fmt.format.height = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].height;
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.43.0


