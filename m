Return-Path: <linux-media+bounces-59846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APFVOyWs8GnOWwEAu9opvQ
	(envelope-from <linux-media+bounces-59846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:46:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 551004850E2
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E11303850A
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8CB43C076;
	Tue, 28 Apr 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EIZegf7q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E057429813
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380094; cv=none; b=lsKSH68/AlqMJPqlq64Iu459COrY1t06kVS98Ghc4I6DAucQWrQMo695ODRCtm+MsNOrl9pAjlrel2akhYEAyHvEN5cw66cymc8OBJitk+eOrw5kkj3+8vhQHi1r8/2hBmZqrw1faZMvG6YIlStDIEGd52XDT9+D3nMloYdYt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380094; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4ymGi8Y1tKhdDBa/aio+CZCcT0xXgkO7zb3OxLTkD/0vw/snJDCtVC47eZip9bJTwstP+Z1Xejncy9IRx4gYA8FqQ31/BYwW0AC42Tqv4OIr6dJlPd1QPLHNOYCKTgLS5XwM6eD6af5R0kZRmshWIi3umbuamw1eGGKfWyWUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EIZegf7q; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a62a049c1fso8717960e87.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380084; x=1777984884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=EIZegf7qUXVSCVNOIi2RFaJf15o3XoEJTtqPMhpgbVM9u3dhO/sepleGrANicgjib0
         b2AyeCMBO0ve8tvdE7GvVAFe+RP+DKxVcBqJlw7BxbZJQs97oFr1tsV9rYxNRDIALVL4
         k7n1LSgq2sglwpsdknQZdLLlv7tNP6shw+PH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380084; x=1777984884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=MZLclkpqHab8BeRr8O/4rL4rXNJYUjnVDC+rpRHr+uM+ZKJxQnCikjLKoaHJYrctWV
         u8jNEYW/InhWWHRAiiF//cZXmUKjBpz0ERswv8KD8A2/eQNOEAdXx+B++uI0EKkJ5eSv
         JT29hkK802GvXCWXGhRUmMo2jzuMx4TbDvt6C/w8zxXpnwLQKRTd/1qNjVaZgI0Tkvkl
         XjLff+nQhbqykxDEXXJNM+G0vB4W8DvB2oAjj8qP73TTljdZeBSQlI4WcjZ2ces/8U18
         feGLJXA45vpXaIyqF2DaVImNhF7VAXCsf0x97rcA9qFg3HyCBabvPfUSCnRJlfh4jg92
         qUUg==
X-Gm-Message-State: AOJu0YwyQHsF4xQ4uPpQ3w7NLBNFa1LvDYwyo+FQVI6EUS29CTASyAgv
	sihjri6j4xV9M1J8amfOS2VKPHWHOR5c/i+1dIOvDeZDB1f2WxeddQPqZ0j+QFbJRg==
X-Gm-Gg: AeBDievfCouMoq/8DZp3Yg40yAuyCT+XR9rfR2hOaQZ+D79dCRmVo4r0H3yJxXpvsn/
	qPB22RIGVPFoS82WdlDu4ssDceAu4sMEYaqUvWR37TqD6FIj71XN8MxkgrbgmjYRL9ixn0al5uc
	zZm9eOKGTPwu/z7JJz72IZX0fO9nDDradMCUFkJE2T9KlzdrfsIzaqPD+z0jbfA8aS+WbBMwVMQ
	1YnnT7FEBGwlkr9qIpMZbhCMbPR2wRPxifkOW8zz6kvdSK7Fp5/EOmIeaEK+fQ7DrayBGFDccEY
	MwSqZDFNc11B9tcl+Pj+sX1e+pRdbkQ4qHy/o5xKlZo+BQ5MIMnurAVy30GK8ol+yHcjDtte963
	V36v4SzzMSZUkgS/gDn99g9MtzJ5V5LW8qW3hx0+bw3ymw7iidNUoN5BDdEeKKqe/kYA3HL19qX
	io2xd7l6ScitLwGDZtQgadAQLCGJ9TI+IvNmy1mJlRr+VfLUlk/Fpi+FV9POgdOiMP8FJFRY5GE
	pbwcjlhrrNCOUlW5g==
X-Received: by 2002:a05:6512:3d1e:b0:5a4:1672:59d6 with SMTP id 2adb3069b0e04-5a746416040mr1270829e87.15.1777380083740;
        Tue, 28 Apr 2026 05:41:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:22 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:10 +0000
Subject: [PATCH 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-4-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 551004850E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59846-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

If the driver's dec_output_info contains invalid data the driver can
write in invalid memory. Add a range check for that.

This fixes this smatch error:
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index d26ffc942219..f77abd5e122a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -584,8 +584,15 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 		p_dec_info->num_of_decoding_fbs : p_dec_info->num_of_display_fbs;
 
 	if (info->index_frame_display >= 0 &&
-	    info->index_frame_display < (int)max_dec_index)
-		info->disp_frame = inst->frame_buf[val + info->index_frame_display];
+	    info->index_frame_display < (int)max_dec_index) {
+		u32 idx = val + info->index_frame_display;
+
+		if (WARN_ON(idx >= MAX_REG_FRAME)) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+		info->disp_frame = inst->frame_buf[idx];
+	}
 
 	info->rd_ptr = p_dec_info->stream_rd_ptr;
 	info->wr_ptr = p_dec_info->stream_wr_ptr;

-- 
2.54.0.545.g6539524ca2-goog


