Return-Path: <linux-media+bounces-55408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPEBKKZ0sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80B264EA5
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8BF53030FE3
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F35C39DBFC;
	Wed, 11 Mar 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tdVkXUHC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD83BADA0;
	Wed, 11 Mar 2026 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237271; cv=none; b=HgqE908Sako+ayyW6cPWzpwkhFSYwLgSdua/2xgt3EVambvmpjzPNfPgaYdlTw0+gRtyLGrhp/uS84FBfT3+xQyVdb1lbnRVbcpZ3U9gdNm41+XM0kxWPpwLYHXj9MDguumFJbI23IMbdG3z8ctQDNv2WfbKr++20leEowaWKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237271; c=relaxed/simple;
	bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5HSGxY2ThbTqrk6VzMc+KUyH6C+4UH5mezGd+OWZxGj4Mrhx9jFIwYmYri9ELbbpAVSwfiKKfY5UxXHoGbtgxaZC/ilGUd8Z43SZHHtV1tAArcxjQ96e53IzBMfys4qFHCwK/FyWX4S+pNJ26tXJTOplKf8YRi2q4ZjTwYW0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tdVkXUHC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E70E4191A;
	Wed, 11 Mar 2026 14:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237169;
	bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tdVkXUHCxu0qOJI5i/jj/aLgA94EzXAJ8PlHCnA3WrbbJw4frfRZ65rN2TYwXQ5RD
	 OZchqattXqp2XTdR4TIX6cX07LrXiSfPr1BKCbxsbU/THHX7zpX0pyOIg4mDUSoEgk
	 Vs4D5NemeOlM0a3cjvY8L7F78CxnelIvbmzOHZ0k=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:23 +0200
Subject: [PATCH v5 10/10] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-10-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPsrDWN10TX3pm7T4HOaSE7tK0T7FYOyjVEk
 +fMTcCedr2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz7AAKCRD6PaqMvJYe
 9chxEACBKMdF9ygz+FxiOjIl+xGI7vsuv/MBK+54fTqxSf0Zf0DdPggFzSLSSwIK4UNBzD2USRW
 b9DldzG+3RluPyL1YwmTrbHPmEoBCxR1tkyJSAqMqKnVE6DXkRGzXKukrpdnkCaiwE75wWvw0D8
 9JA16v9UCV0GMxgkytAyQDi/bPXfRQVj12fs9uzQ9lhlfQxXjRmDmRP8rXwkME7B7l8TKxD/Y0z
 5bRrJtAhE6NzACSRw77gxJWtKBF9nwuVGQ59CLiWaoqAoI0F42mB9zp+F2u7P0qgXl9pF5bwrTV
 G6SlE4/jCzLVBUPqQPAJb8QqOvKkB6u2ZGyx+81P8Bv9aBp2Oa9OWEo9s718mpI79NhQYur1Yn/
 of5B7Xy/TcoUiYgkEdRcD8vhjQfvud7+pe0LG0XhfHkKEQ/s/Bi4hzISREtclHDmFtrWSrql0Ot
 z4YrX2Tup+o6F8jdHnbdm+VTdc+hGumX3A9aw6IUBFEKsZPR07J7EByOa3EWTEbcWoXlKjmUv9d
 JgTY/ZUzlSTeP+lJf+98jn0bnEJwoE5CVoNm4hEQsErkmTcSKvCfDV2/FMHoJYYTdskmtemGvj9
 QH+GjHN4W1AfBs5FkbH8sgu/lD8VNc9Saz3jRC/EQ5R2uAKlcPsCG8FTXoG1iB/5S6COm7cldqB
 ANUqaXT6kKAJERQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 4C80B264EA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55408-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 18d63731b6c0..e4b9a6204815 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -340,6 +340,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -354,8 +355,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (isp->stream_count == 0)
 			risp_stop(isp);
@@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -380,8 +387,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
-	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
-					  BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
 	if (ret)
 		return ret;
 
@@ -423,12 +434,34 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int risp_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &risp_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.enable_streams = risp_enable_streams,
 	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
+	.set_routing = risp_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
2.43.0


