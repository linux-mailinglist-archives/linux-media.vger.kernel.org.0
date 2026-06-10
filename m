Return-Path: <linux-media+bounces-64420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EAk5O/lJKWozTwMAu9opvQ
	(envelope-from <linux-media+bounces-64420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:26:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DE668C6C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=snu.ac.kr header.s=google header.b=HjOXE5hi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64420-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64420-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=snu.ac.kr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5664E321A6FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35DA3E0222;
	Wed, 10 Jun 2026 11:23:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8E395DA9
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:23:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090628; cv=none; b=W9c0NjlGI+ETTTE0LSsoM/44P2esUyVTzgD4z2360UlaAqMzX7UDgL32xlS9EB+b+8U918KRFEK9ocK7Md0YKjreGvixiGREBbckd9/jfqz/XzTMQEN7q/qQCCV9QMhhL6g26gxuhVtfJgE/LCXL+2dYZydXapYqdVeZgadkiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090628; c=relaxed/simple;
	bh=YWn2LYy1ol0TFct/7fZLqkP0AZXHmHetQVN3oPRz0nw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VWSF6BB242+ueJ3+wy6m9o8vEVs3KQKGtMeKefnr9CSBNei6JXOD8NecWw5ZEYtBmrvoLwuq8V9G/DJDlAsafp0aZ4lrww6sZdPIFAoc/KYuiUHEw54ra9/0vs9iaSClAUlpasdtMCKPA8nuPS0zHNR1JRCo7EQMztjoS2vDAns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=HjOXE5hi; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842358aaf36so2482696b3a.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781090626; x=1781695426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ku2DeeJg4NTQoZADg12veRm7Hl+QByQgrLdm/E7NwBU=;
        b=HjOXE5hijlZzqSrdUr1WNZghhr3kVTHAC0nmFuNHdFDFqRkhPxek4trZUtVxGEaRp7
         Wb3wggWVkyfBLpz3/Qb1wlusaKGGnM4wHorP2yXPAGu6znI4JNOUN13fbLqAiNt7tgQG
         EFO11PPhhEN/X8bge9Ht+jRXktChiMBbSR+LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090626; x=1781695426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku2DeeJg4NTQoZADg12veRm7Hl+QByQgrLdm/E7NwBU=;
        b=fHxq96hJSOIyrroNhUg0KlvRkNa65o40jC4iTeIx5RcMrjezJ7EDupkL86vcXdgL23
         VWvaDk98LGIS5NlyAexx9ct8NmZ6e6yHy4oiAte6usZSee2cliVRTi2F7eNvpJM6BRfm
         3H8jJ+5bbdX4vW5ALSDIsb3lTbU9MvKl1x2YaEFpP5U0pIEaap81Z6DR8oW6m2kWYhCQ
         Cq07C5vbwzfxDwD+LRDGRr13GxLOhS6uy2OJSUlZSC9f6+kQfU64BQv7fKjsyzTg4rzy
         uTH7KRSee2p5Dbzaza1+TBe2VQ/objUgHlQ85pC0lppeVJN7Pq66NGg1+zz5UFcC3wci
         7AFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9reU5A3JZlsXm8WVngChDIhPDa2LSKSWaruTbfuPKRPPgKhG4cSZxaXJw1vk9ZsG35yn0INZzbAvD6Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuEbOeYG9UCbkV3TTfKcJ0Szxq96bF+Gc7ePW2nQ/EHmCg704
	JeMR9tyo9ZS+y0ETBlVCMgkUbiKqV7dwUXLTHVF4xlUtFUG8mZGjPyCBpqvjru2Balo=
X-Gm-Gg: Acq92OF/yeK8lyrovmDo8Xro4gVYYu9ef3orOkgNIsYncB2xpYLNavZu+gOyD4RXjLG
	tkdEQHN24HG+iDT793B5pugk+KAIOuM2CCTmYieR1ZCGqCRd8+hJvOTDWBDTVWo9uv13Sbo+lnj
	y3L/qvu6betkCskveIzYgp+QM8a2/V8NCDMiOq9YJ//huJsUBCB8o/BJxGda94FSA9QnH1Ym9/4
	a67QP8wLLaUXZhTHLGtOoLr0UGNPuV/es+rRZ9y8VucLdFipWdO+XFsKpbrHl4P+KJRZE+YGoGs
	yaAyxQrKbbiiQfWGtShUaRQA+02L3VWTody0ZoDJwU4hQHvXIQ3rHKignD5R1VFQrpVPHf3k+gg
	7CNPt/+RzgeCZrMlclfLeWDqPHBdBd6saj+sg5ZKuLBGnzHLpxHTnbmkuBQY5yCTdbIt7bt9uXr
	iWVdZkF1HnxO4GXwX6i0WIV7eUsNvKaLPuT6j4Tn5ixtvH20vbCyeydUptHgQoAhG6pv8=
X-Received: by 2002:a05:6a00:218e:b0:842:4e43:6f6c with SMTP id d2e1a72fcca58-842b0fb60bfmr25579445b3a.39.1781090625591;
        Wed, 10 Jun 2026 04:23:45 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm25232136b3a.13.2026.06.10.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:23:44 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: media: pluto2: BUG: spinlock bad magic in pluto_irq() on early IRQ
Date: Wed, 10 Jun 2026 20:22:39 +0900
Message-Id: <20260610112239.679629-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[snu.ac.kr,none];
	R_DKIM_ALLOW(-0.20)[snu.ac.kr:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64420-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[snu.ac.kr,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jjy600901@snu.ac.kr,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jjy600901@snu.ac.kr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sangyun.kim@snu.ac.kr,m:bookyungwook@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jjy600901@snu.ac.kr,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[snu.ac.kr:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,snu.ac.kr:dkim,snu.ac.kr:email,snu.ac.kr:mid,snu.ac.kr:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 441DE668C6C

Hi,

pluto2_probe() in drivers/media/pci/pluto2/pluto2.c registers the
interrupt handler with request_irq() before dvb_dmx_init() initializes
the demux spinlock with spin_lock_init(). If an interrupt arrives
before dvb_dmx_init() runs, the handler acquires the uninitialized
demux lock, which triggers a kernel warning.

The probe path, in pluto2_probe():

    pluto = kzalloc_obj(struct pluto);       /* demux.lock is zeroed */
    ...
    ret = request_irq(pdev->irq, pluto_irq, IRQF_SHARED,
                      DRIVER_NAME, pluto);    /* register handler */
    ...
    ret = dvb_dmx_init(dvbdemux);   /* spin_lock_init(&dvbdemux->lock); */

On a DMA-end interrupt (TSCR_DE) the handler runs pluto_irq() ->
pluto_dma_end() -> dvb_dmx_swfilter_packets(), which acquires the demux
lock.

If the device raises an interrupt before dvb_dmx_init() runs, the
handler acquires the uninitialized spinlock, which triggers "BUG:
spinlock bad magic" when CONFIG_DEBUG_SPINLOCK is enabled.

Suggested fix: register the handler only after dvb_dmx_init(), so the
demux is initialized before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung

