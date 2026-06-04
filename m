Return-Path: <linux-media+bounces-63773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H3tKK1dBIWozCAEAu9opvQ
	(envelope-from <linux-media+bounces-63773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:11:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055563E630
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:11:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JywV8Cg9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63773-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63773-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D7D13178450
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03993FD971;
	Thu,  4 Jun 2026 09:01:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16CC3F787B
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 09:01:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563713; cv=none; b=h0Yi5oBzE4kWxk3XucA7vRG7p6Q7q0y8mOcdSevsaWWWpTaEDNykilPO05olS4DoYrA5xLUneLND01NuZwXuge6N4Rds4HbNpKJhTDTCIG5uthD/HVBiSEHmatbANftFU0INfXUx6lDC/OYEBLowpFFgZUasnuxK+CrXs5NQrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563713; c=relaxed/simple;
	bh=6sS/rOAwEAnbZVoTrMOiDHFw6dT7vuBK3ka0sNLl7b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CgO6zma0BlGJGTqj+j5LKAw1X7AIEIoHnYT6srDQgsXFuRthirFXDH2F6NkvbdjruhjuszB3/cGc0p4GuMP9WVjGCvFMZwn9b5lGwbO5qu07zg0RPrOzvD09Uv5uLDYq3AidFqF11OtissA674FgrFEPoJ3I/j5NtDhKUyclqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JywV8Cg9; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-3075ce9c05aso846272eec.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563710; x=1781168510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=JywV8Cg966a5hLdPKq2WuMLOoSHKza7u1bzwTHhkU68mrILgYQkmyI3pXXb10uQZ3h
         KA+j3V467W/WCEAysain8UwMkHF/G3Z39mQzGACnrWSwqw6qPpeQJLyuIbmkYB1KtFLd
         NzhsLhHL9sGlSC8yKdquQtMm92GP0DPO2g93EQWCMa2PhbBnMbkspyfurqyT+RxcpF1z
         UMYjJDpAXYHVFS/EG5CqnH8FcWcmHOdu3c1GdTGHtzqeQErWlnpam2n0rFMG/0ixIiFk
         rSpdPb8HUTi5yGFAjpn3zYyw78V0J7s8c61Uv47rZAO4iHAglAQuX/4hlgA20CiUYyKB
         nnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563710; x=1781168510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=I2bzHEfMm5Q48Cy3K0zwTovz92benbfo24FbR9TBSyCXfUuGQOYBUtTCFMZYz1bnOX
         9sSKPqSdg3RYWtHifWuVoUOOYpzXwF27kRW3bUDZgu6cQpQw9N5zYOqyE3C9Y9L8XDrJ
         fAH5YTJsjFWQT8tQ5676OkGTiTLtc6LTllY8GI0jmlC/emsSadb6SON2RKaDnbsjQ5RD
         /3YoOCZN/5nkQ6ebnBoM09I8GWs9Tchx/1ewJ+DMN6VwwHHCXEztXMsA5RVgmapniWKJ
         SzpnQVDO44gVvVVUTXIfG7T+GebU3i2wZ9/xq3ll409PNe31hENB8XZJQH/t4iDaY/yD
         kpbA==
X-Gm-Message-State: AOJu0YzIYGw5p4qKaDxrM57Tvdo2irHbfWUC/atjF24pDNMn+Z+ykzVy
	60BWEQG98W70aanllEBWt8DDwqIK7Rep89cfARKPX7tvxbTF37aYgjSdtwv/b8sQ
X-Gm-Gg: Acq92OFNO+lL66wl4L9wn47JUNSBYwjpzxyHU1EEsI1K0+r2O/OqV2f4fZQ8UL9fNaj
	0iSOFqM6gsOva6Kn0Bb7TkbfGOFYv5tEc1IFJ5vxF+FDzAfSR+laMcW9QCinkGeW+5M9FIQGh3V
	RGxKYfENwq8DUpEGaNCYzfZv6cLUP5UybdoduRKxdd8PF1M7VTiTzLFXHL2wwFo7Elbk+xDLNKd
	W21DGs3BvFg1LZu/+wHvSvWVDNdqxTzB1hylxQQWayEId0g35LPFr+/ofFOSt64BdDtwUabTFjA
	TZUBFouo2gBshBE5YNlpaVk9d38LkEIdH9e1ffCP/mrbAArlDWR2hT7yaS1dp7i2oBW9VE0MpHc
	nZ7MIpncCDxg48PJUKr+n07e9xfy8WGu+yk8MChbIuYWZmW+XHWV+fzyAamJ9KcSaE7xQtET234
	yM90aueYlSK1dJRmyiW/wqm4JawGZapQbqAYBKvbuCKeKCBlxDsNrkfRLzoo5Fp/sL1w==
X-Received: by 2002:a05:693c:37c2:b0:2da:4216:7ea3 with SMTP id 5a478bee46e88-3074fabd68fmr3680720eec.14.1780563709986;
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Thu,  4 Jun 2026 09:00:59 +0000
Message-Id: <20260604090059.46355-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604090059.46355-1-dennylin0707@gmail.com>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63773-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3055563E630

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

This ensures the performance state vote is released when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index f5e3341e1430..a7d25f7a201a 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 		return ret;
 
 	ret = pm_runtime_resume_and_get(pd_dev);
-	if (ret)
+	if (ret) {
+		iris_opp_set_rate(core->dev, 0);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


