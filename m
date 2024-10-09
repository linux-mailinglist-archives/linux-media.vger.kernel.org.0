Return-Path: <linux-media+bounces-19301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D6995F6F
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 08:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E9E2832D5
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 06:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B05175D4C;
	Wed,  9 Oct 2024 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWLUctv2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316BB157A5C;
	Wed,  9 Oct 2024 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728453973; cv=none; b=tWxYYKFXnPLyr63gZLG8NJg3JoJlb2Cke5ZAxHO28tZm5s8zipQ8mymKPb1mkLYoj9E3Adu2j8ZYYO+i3F680Igd5pKOZ6zjHbK4MW8B6zbL07Ug1hbSIrbBYaih+t/vD1hJ8sZWekOwOMhjJ04KDGt3wNgLP2vqOC7ImNipkF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728453973; c=relaxed/simple;
	bh=A+xgCzVhGo/udPZxNaHb/fMOubRLtL6QRPJeZZjNXAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dmK8FaZNc508pIFDLtuN0LXklDgDa2LcQHNcX7af8+luqL+l8h2bU5HfyXF5nVORr80zGIEipqpi+HFH8UqFUaUHd8Otco891OgYXcesae3mTtq9qmql5ywlm+vH5gT9OypiNNXFjQBful6VxLM/V/rWeVgJKuwlK+2izw6a7XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWLUctv2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so58119381fa.2;
        Tue, 08 Oct 2024 23:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728453968; x=1729058768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmtqIzicJp8fLfYVFFWV2vaF+yNi/Ge252b9z/JaofU=;
        b=WWLUctv225ICXDA3x1w6cxyOZ9f085ipZDdl2x+GaYRDA0GtAOLKAYS5jx99SDSF6c
         fr4gmb49eXs93FbP0P4PUlO6VrDHAKrryURHPmVHd4C4mdj7DF0FH1cPiDt6mPUj3bVf
         YTDuoyQuzak29lk/IrVtzt7y/81eYNpA/QOTjUvJ/tUIJI1/Djy7ryExwP84fixxXN3Y
         CsCoCTLhDXGHhmQujqacQcVuYZVYVx3QeQsy6F46OMH6MdzgYIkRVX6D5rqjtLNh6d0G
         ef8pRC9re/G7ZuQAE7BH5woeSN1R+7GxyaBW8k4jguWt3Hij/hjgMdZ4VIETb3FxDEO1
         +SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728453968; x=1729058768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmtqIzicJp8fLfYVFFWV2vaF+yNi/Ge252b9z/JaofU=;
        b=EX7qaYVVMmFqkY0uzPh/HPRNljkx17q1gfRQ6p7nLdoRMUonDwATJCbhmG4Iphd4rK
         AYijWn9cfrZ2BzH4liMtEflM1s++On8NAcfh79tXNYMxCwLsQXdOpDoa3ZEMDZW0SMiV
         bzp4DzAvwcwpmQxh55wje902P8e7hbuR+8B9qmXw0PcnNCYydehQhXyFZEyooxgnRNxO
         Dwd03GJ9nOETB2qixCprstZaDoyu7pBxs2dFWzlYxX/7IRuIUp6Mk5UIIOfVg1PAzbq+
         DXqvHPnrF4pdVsTP4fKk03LnDetrtH76e1heZxuw4CfQJ2N0j4D94ffO8CCSxZsVt7Da
         IlJg==
X-Forwarded-Encrypted: i=1; AJvYcCW8twDfiaMghYm19WXZvGW7WoCbv3RLeaDLQufbVK6PqWKCdUTUqAY3hKYR9dpYiwKNY0d0Gb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmsSNPjuVfvGbiFQdhQ7eO47GxfCwWREia1BNzUpbokYZKuXZc
	u6wivedEhHGM/Di6RdvVdbL8oxJa/Uifi4VGlo60T2euDt1A9WQZ+j7TGmg0
X-Google-Smtp-Source: AGHT+IEw982+TEx0fP70rrR5FbpdNW0aBPmVZEPGx54iBl7GLqzvyvhDzrxGHsH/H66oP/hPMhZayg==
X-Received: by 2002:a2e:a985:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2fb187be78bmr6546841fa.32.1728453968083;
        Tue, 08 Oct 2024 23:06:08 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b249cfsm13705541fa.80.2024.10.08.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 23:06:06 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: tc358743: Fix crash in the probe error path when using polling
Date: Wed,  9 Oct 2024 09:05:44 +0300
Message-Id: <20241009060544.4675-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If an error occurs in the probe() function, we should remove the polling
timer that was alarmed earlier, otherwise the timer is called with
arguments that are already freed, which results in a crash.

------------[ cut here ]------------
WARNING: CPU: 3 PID: 0 at kernel/time/timer.c:1830 __run_timers+0x244/0x268
Modules linked in:
CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 6.11.0 #226
Hardware name: Diasom DS-RK3568-SOM-EVB (DT)
pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __run_timers+0x244/0x268
lr : __run_timers+0x1d4/0x268
sp : ffffff80eff2baf0
x29: ffffff80eff2bb50 x28: 7fffffffffffffff x27: ffffff80eff2bb00
x26: ffffffc080f669c0 x25: ffffff80efef6bf0 x24: ffffff80eff2bb00
x23: 0000000000000000 x22: dead000000000122 x21: 0000000000000000
x20: ffffff80efef6b80 x19: ffffff80041c8bf8 x18: ffffffffffffffff
x17: ffffffc06f146000 x16: ffffff80eff27dc0 x15: 000000000000003e
x14: 0000000000000000 x13: 00000000000054da x12: 0000000000000000
x11: 00000000000639c0 x10: 000000000000000c x9 : 0000000000000009
x8 : ffffff80eff2cb40 x7 : ffffff80eff2cb40 x6 : ffffff8002bee480
x5 : ffffffc080cb2220 x4 : ffffffc080cb2150 x3 : 00000000000f4240
x2 : 0000000000000102 x1 : ffffff80eff2bb00 x0 : ffffff80041c8bf0
Call trace:
 __run_timers+0x244/0x268
 timer_expire_remote+0x50/0x68
 tmigr_handle_remote+0x388/0x39c
 run_timer_softirq+0x38/0x44
 handle_softirqs+0x138/0x298
 __do_softirq+0x14/0x20
 ____do_softirq+0x10/0x1c
 call_on_irq_stack+0x24/0x4c
 do_softirq_own_stack+0x1c/0x2c
 irq_exit_rcu+0x9c/0xcc
 el1_interrupt+0x48/0xc0
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x7c/0x80
 default_idle_call+0x34/0x68
 do_idle+0x23c/0x294
 cpu_startup_entry+0x38/0x3c
 secondary_start_kernel+0x128/0x160
 __secondary_switched+0xb8/0xbc
---[ end trace 0000000000000000 ]---

Fixes: 4e66a52a2e4c ("[media] tc358743: Add support for platforms without IRQ line")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/media/i2c/tc358743.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..344a670e732f 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2168,8 +2168,10 @@ static int tc358743_probe(struct i2c_client *client)
 
 err_work_queues:
 	cec_unregister_adapter(state->cec_adap);
-	if (!state->i2c_client->irq)
+	if (!state->i2c_client->irq) {
+		del_timer(&state->timer);
 		flush_work(&state->work_i2c_poll);
+	}
 	cancel_delayed_work(&state->delayed_work_enable_hotplug);
 	mutex_destroy(&state->confctl_mutex);
 err_hdl:
-- 
2.39.1


