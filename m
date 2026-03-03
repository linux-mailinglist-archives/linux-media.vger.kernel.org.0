Return-Path: <linux-media+bounces-54273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHkTH1KfpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 589021EAF97
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E03283037259
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAE6390212;
	Tue,  3 Mar 2026 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGB8rqzq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CC38D014
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527392; cv=none; b=FMfFKiscjkfVL6V3dA4sFGRhEGMT7T6oRfKhpO7AWTzDJGj/Dc65lJFWn674UcIQCh/emDwIifF5+DffcsanfFg9OQ0ldP+y0UlhHA5r9kLo+E05yQkskMcYox6hiLJnggvInVnL6POSm4Ro+LMBKiXWdUSQawhXusNfdHRFacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527392; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSWwWe2uzGK0kCGdBNAmqS+fcpAhamlWIfsIrza2aS5gyGUva9Ur3GMSfwMwAmS3Iu7EyCxppQcN2wM/doq0/uD49msNHd/K0265fJlSccx6HbQfssWrNCURLgFY7X+5MMk6/8JUzBa9XlOzydpWxeOxltGxTM8fRLIkogHcTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGB8rqzq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-389fa352b0eso78550071fa.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=KGB8rqzq9hLKZw71u8fjqsoGtYpHfAvE5RgXoQkkarCFkUzWU3UB4ozylpH0+GFK1Y
         of1Ysow5Ma3LrbCzvcg1sSZn9gIhjZlkW9+zrn7BrwrFy+7oFRYbeLbaoKPINCT9BoTo
         QOj/zOTs2bZ+Hzhi9BjQ0/3JYu+EKKibkyo0QN3Tee2b3QQYkPgPo9WOXeE4VL8P0Mak
         1x/Tz9stkAJge4bpHeNAqdtRtpBrGKqq0t1y+XwCW9UkJSazlsCHigTBbiMM9rwi/NmF
         2nwLr/E7/PiQQIVJ24gXvaQSJrQKTpgsL+55wKrcYoWVx7ApKfVbGUIFYJrHi3WTbLps
         6hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=EUsU8oDZ3OYsN7/OPP+42W/2HxUKPBmD05BmwVCBWQZrDE+d+qCJ3W7B2YbqEGleNm
         3mSwzzYrMCQkfuYNVVuFhn4VBAVghfXb8epJjK6vm2FSAp3kDTUOzIGHXk0wACW0cbNE
         im5gwtOxyr49BPv+YEMElUYlAPBM4V+M8AQxojy6q+ENPpSDJ2zzHEtWrAE84NwrsmJq
         DBYqNccGcMg10riCUvG7iF3IVo97qajT1gSp5ob3XLTnDNAhkFng9DMQOFLFr4GESUBk
         MlWx7RiqeDj655QI4UAt+olGwBh9xBevhfEdRYF3TcaOWEpVNEgKHscFPbYTX0ZndYGH
         LXcA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Sb8kYXKc47wd55IhwilhV5nKG2si2/3gw6B3LZdpi8gnUf15980IU99Z9aqBXIl6GQTbVFkPqdExww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16Az5iOGaXpoKIGHlVgtWw1E6QlMgGIS1TuT2MUlPXC114bTv
	HeYfh5va6XNQWFlbhy3/pa7cwexAtY79CnyVmW2Ntdm9O4A2KzakO65E
X-Gm-Gg: ATEYQzxFjjXjq6cdxLd5sdnAjE0yCBOm5e8z5aRyGN9HCR7Yd1CMRqa+0Qv4zmQW1P2
	8bhT3/kWo/AQOAfVCFsqq/nshI+N/0AV4nrAnbZGrTPwB2VhQmh+GNXJ6ZK8/JepzNqsmoLVOBC
	thmoE7Dh0r0D/K/dX7zhYoioEMFgMWFhRozUgGyb2Zg6/x6DDXsmAFXixbldlp1ptWyat3Ni7sM
	tHeUVrDSdCvNMF10ZMIbwiX+ECFV3t2LVhUGr73msv+BX55edi7bAG53r/PQUy7M1rwSwB60mXF
	mOqSOkFVHBWp/jVG2zVSZ6VtCLRrDJ8mWpxPLrq+mWvEJp/zKCLIIA2JPOSylwrpdyE+QqYPLFu
	79cObsILUWRodQx+a/Mb9kJrU5zn9fqoZxgdRqvz/q3MAFZHYEXuM+m1vWjyiMglQALnmlil9Oc
	4OlMfjYX3mAyWvHWC3fA09i38=
X-Received: by 2002:a05:651c:b21:b0:37b:8b7e:efd with SMTP id 38308e7fff4ca-389ff365c0dmr93909351fa.39.1772527386558;
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Tue,  3 Mar 2026 10:42:35 +0200
Message-ID: <20260303084239.15007-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 589021EAF97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54273-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0


