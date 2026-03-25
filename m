Return-Path: <linux-media+bounces-57014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOvBObLOw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D732462E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B8C0307030C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198D13D4118;
	Wed, 25 Mar 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="kjtpJYN8"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021077.outbound.protection.outlook.com [40.107.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361683D1CB3;
	Wed, 25 Mar 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439324; cv=fail; b=deQWIR777eNoG78jDRW5USJdpn9E7VkmaiLPzpKct/YfLqVPfWBi/rJPIIaai7vh90tkJI/kCYGZMGDyjHO4mChWBJW8DrQxlB2l1Ll5nfM02VlcVPowj2KsbFXxrxoTNQCMw+qmlVkmEpvkhrqhO85NeipX2BrnJrGdQut9Z7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439324; c=relaxed/simple;
	bh=v0xmikUuYoixoX0db/svL9PpmJiugjDpW6VqxTTO4y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8bYZhl6ZdUEy+/gbOmt6eQIGsK+iQp3XvNEePJcFri5kcetrKf9tnsMsOiAyvuEyYQuSO6667VfeSfI1613OILQ50O72mGS1xaiJX9pc5nrCqhEOpY1hRmQDd2h2X1Fi8s7tK2kj9jX95O8fgwzndTQQ0OAtrdVgg+DyLTUgyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=kjtpJYN8; arc=fail smtp.client-ip=40.107.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXMpp0kjE2e5ilOZgu2sfpVlD9/mzAYbnuQxWMptMcXzerAk/HnbZebjAkYsHJcRZ0+JxJfGlEOAF+knUg2mUymik2wCg2TkmBqZVr+BRELsWBHC+XUR9bcHp181yo1babkiYhQBXQsSfuGs7lPqR2NvMzNfyHrEpX8lcFSzrNv6y245k447Zw6OXn0EYQeJCVpZLQP7T5Mrx1M/uzloKIpdXTSIap0Iv2QhvoC/DJ/+DSxMYVuBoJL+qdvkRXrMujUFhsqC4WLa5bnRgGDmM53Qgnzu4dODTvVvXHxOb84bMASbuUzq0201GFWM32zRDvcRLvpCHjqnyJ3IZV13xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o90sbzqH5PvCl41PV2l29WdvrT6nqDR3R4tQvdwJILs=;
 b=QKVqbdoFj49rjBd9vtkYc5Q+dB8C6eySGydGofvbkKRMum0+Bot7BsfCSPppPP9IWAx4uwDvtkG4l6E8SvvIsvIaTpT63aDnrLYWF4aWKTce/iYRIBy9bbjYI8t/9egAuS+q2pwQljg5q+7o7/ew+GTxnr9jBWx6l+lQeCg6H/nRsPPvfCPg2UhOQO4vPDi3WEOYmy7qNM3TcjS18ZDDZC9R8PBHbIK6GR3H4pwereOaMccnmokdwYxr/5/puCu6JjiN9B2q8Bx1L+6Jxz9rC2yOd2FNaSvsb5ZI4FL83WTN9v9l4YAQLRuVsVzesH4bQRHlxMUkwRh+ZAMcmw1NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o90sbzqH5PvCl41PV2l29WdvrT6nqDR3R4tQvdwJILs=;
 b=kjtpJYN8IdxeT74ViM6zVC9GsyvXfFOV1U+W4oiwi7FTIegXxIXkObiC3rua0ek8DbiuhuaN2vnrIRroFsYXd/leuN+T7dgPN3ETJFqw3adL4bpiGiDt6DTuMEz6uLj54LVc86wVqurpuAM55YXW+hAn2YoFZZ0Nm1mzWx1So3skXwB8IRZNGh+6y+NQON6IMi7G1xJsf8LbPRpxNwU4ylkV9XkHCbalDaaqQUAjiFsr8Mv9XCwFnD3UDbeAdn1Yeag8GPI/0RBOKieqhJ1xFYxHBSIvk3H+dgt81DUYBvjIjlxyZNjAQaEGXc0WhbWx/4NTtU2Swx6CKSIV4Paeiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:48:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:40 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/15] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Wed, 25 Mar 2026 17:13:59 +0530
Message-Id: <20260325114404.95188-14-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb9cfec-2908-459b-a6a3-08de8a647530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e2agenJ5X32BVvTM0I0qYaSF3BMb29V/PEickv0pfD1lEODTemWkcsBeD+/pRUhldvB1AbZzbrRsV3vAXaADYoSpm2WJkVHBsohLfirI7GHgUq0STszmzmrMQOcEih6GSNmn252n6fGL9eBG2h2vWRbS0AzX0JAlykitkC4s8eo1WUBmBCiB8mY8ysBOnnIxVeiPxM5g6+5WIFcA9FARIiuilk0/YjEFM78/g+O/d/haS520pLMTGOaBuEWjaSa4X3cH5AZ3YZdxQVspocvDSANpddehYHDh9bqua2Nbllv/nFGDKAbnqJitDRnG7G9Ilkqo/r9GbpnyQTNHtHG5R2w7ZhEfRj4Yc+Lq4wZTbnDosNiTh86TyAXI2qih+ZoKTWR546sLaFZHDwX1rftF0kZ08MmVwJD7R88xFy0c6Ao7GBLGMyEXrJxORaPY9QNQkIX9isgtNwNMHp2R/Jp7deaojymT4yncehDq9qdnGzt29XUTXozSVFjtxNy7wk6CP9ViootPeMbxUh3iULPS64LnC4fT4GBfn06/DJxrwSyEhmFHTl+YAsBZPIFCLDe2URBdJkJKiDbNrXAoeEBtB6FhDTil1TbGjVwm33sItV6dVgpyY+ruS345Rj0LctI45lRKgI0s8wY8LzYdnI+6oT58C7132ocPm7UQvMONDzsKiW/mVbF+Hs1kdt7KHO+HRVt8xLxA4MAtfJXpkn+13SJ+SKPT7k/qzA4+xOpOP1rpKqSbJE/J3mA8oMhaV9hhcnyZqTIjSMdso1YgRrbDqPBxN/M0XbN1YghM5mzheu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5L+tH8/f6bd468J7JOwGKfVoFd/QKZ7RfCPt/0nJQn8OHDGJ1/7+9B69koqE?=
 =?us-ascii?Q?ZoeVSGlZwxzA7WlOhSexZLovB67ek2g/CvfXj1/yUu75AJjCcMCKyn7lDTZx?=
 =?us-ascii?Q?77uqpfL0l6bd29+2uIl+M/cSFB5DLsWDrAsmCv8eJas56+NL3GLXROg33yZo?=
 =?us-ascii?Q?5K+8zOTbloQqQgHpxkRpgqTgRse1amJVmPO5k9qUQgwCL7jsSi2h7fkkfMAZ?=
 =?us-ascii?Q?eZCOdDQ6IexvDk69ScbTS7dTRhq3ewFnOzuf34otZ1/reUEmwqX1343/9PM6?=
 =?us-ascii?Q?1vXie1bj90OhQMuQqBqsJYlV8wbBH+GCpavmoDLnKdbLUxPlUqUJ9BD2bUeQ?=
 =?us-ascii?Q?X0hQfxzIYfH9ZPFNUnyiTyrn7gfDb0uCmUARkMJrkt79yScHf4H1ffwQqYeW?=
 =?us-ascii?Q?LjdIoZCDIJmgefVuq51WNNARxU67s/G91IDVfm4OaqJGbFR/HmxZ3yNisg6b?=
 =?us-ascii?Q?35Ahg2oqnY2CBehWY7vR3tCtCTUesG9aVKQ42vNTsgNdbhscxXcBnDTBHVuB?=
 =?us-ascii?Q?9CGIcaZuUs69lRRtHMfT+J4kxfRazXPaaaGKKsQvYaDqE7iHjROKCFDgpQNu?=
 =?us-ascii?Q?dq0ji0VKagPPYkBupMvuIpRx/zqUy6lY+SpkZzk73QrAjlEIjoh1Fd4PgVsP?=
 =?us-ascii?Q?FOHM+ubjrkn2oA36DBL07wGL9J9yZLKo3oScb/vuigFuCxiuYO4dBNgzgwkt?=
 =?us-ascii?Q?aL5p6ubte/9SN8l+so+v29SobVoTCtIHU7Z7wsXSkVbd+VTEg7/2JEZ3+kv3?=
 =?us-ascii?Q?G49kXkJeWf8AvirtvB13X9wZwFsRM11L2I42e1OZCUYDESuxHA7+3NDz+xG3?=
 =?us-ascii?Q?46FsuVgmBVV3E4VLR7va0erW//nDkWgts4jfnoXtPKmunB70GVLscpdqcJoH?=
 =?us-ascii?Q?m+smHVFGnhax+gOvOZOCNzuhqv4jyNT4xJxRfPDAud85E0rbuuEVBNYOpk45?=
 =?us-ascii?Q?CVygXSP9M6wxVMhazd6iCjCmzc9rI2DUSNAAdIIphtWFvPONs8P0BSj2FWij?=
 =?us-ascii?Q?UuCLMBnuO7d80lpssBqoZFsSr6EtG9CFFX3rV278pcV8vgIDnzYG/Gjsq8O6?=
 =?us-ascii?Q?IatVtFjEOmf8g5eHA9h5s7z1j+FG8zxPzyHzv7SzTrFP6gZffSjlaleK1BrF?=
 =?us-ascii?Q?LCJ5o+NsEx5AN0zhjOFE4tIB4OcYIlnoclWqIu/BvGKaHGA1gSnGR0mf5eiL?=
 =?us-ascii?Q?FaVdYZORvDY5FGBU5egDIgGIDlicpgchUTNkdJo+ssNxsxRcUstxg1w5JzFa?=
 =?us-ascii?Q?oreVxo1PLLtRp2QcxFDc8J2T5vm0eQhfHfCEyc1ocKIOmigBZ+CP2KVv7PML?=
 =?us-ascii?Q?PkA9wrvLjjgQF+k+BlagLsCD+o3rUXH0QQBVTTLNVXU395WwQCZFkVahkjnf?=
 =?us-ascii?Q?77y4dLrb5+UwFTWYMW5d0E2iQNSuKV9ZEZ2nODI2JcKA85BSFk7smqIuvT/N?=
 =?us-ascii?Q?iVbeoQUABuHYDIS0h2vYM/frYVUtU4SQrQTjWhgO5pPMU8caDXg5bqe+yXVX?=
 =?us-ascii?Q?O246UG8iM4+HGLp14TlthZv43Vgjh4bw/13MdblZWrf+AY/1e0eIrzO+jmak?=
 =?us-ascii?Q?DOaTk8tGmMGzyI9z4xMid/W+OAK6sQR9B34ZRK68hTVT6RAPhuw+ScPkjDBf?=
 =?us-ascii?Q?UuWd3Y8IQBWWVsmqSMLD9v9Q0bGsbfAWxc5d8KHBUubFVComJWhffIT1fIO7?=
 =?us-ascii?Q?j4TTUNV8PQhSHT0AxQCnGgGKPw5jsyy0Mt4AAuq7VUzMcBUOzXcPK1qYW8j9?=
 =?us-ascii?Q?VKqyaCzO+ImQaqRiV5146fO7sPFieu0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb9cfec-2908-459b-a6a3-08de8a647530
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:40.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9T/HeDLeoIh7Qg1h9NBMV2+8tk3LN6EXDD+4BBcIbjs8LAnkyVqPHhIb4DcEDfKOaSrMuzHWHwEH2h3eC3sxzENl4hIs9q7CJm/QIAl1BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57014-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 924D732462E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 4db257570689..bc6df8c8faf0 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -747,7 +747,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int num_modes;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -772,8 +772,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1


