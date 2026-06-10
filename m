Return-Path: <linux-media+bounces-64422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UMiHB3ZOKWorUgMAu9opvQ
	(envelope-from <linux-media+bounces-64422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:45:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9D668ED4
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=snu.ac.kr header.s=google header.b=yoga54B0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64422-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64422-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=snu.ac.kr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1333243AF5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C33FD96E;
	Wed, 10 Jun 2026 11:40:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C773DD50D
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:40:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091653; cv=none; b=UEUKmBFZvcL3eBg5+4m3av7DHjN8hDJG/wmvbpGMKxLYC3ytc/LU3Yd9Mj9Zvi3hq7R0ClMrDYax7Wisdkk+3gp1c2zCjlLl64XbjF4CdhAWTeq6HwtAknvHwghDukn4lF29WoIzPjQanYU5kvb5O/E7ZnFeX4bwKjGPOS8nTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091653; c=relaxed/simple;
	bh=oN+ww0qJuUHFvVtOE85Vr+JeDT4SilnvuKOtlNx6+0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fBYXI15yq8fV+71SeoMQC6lBq3e4HkxifNrSPaFED8HCKNthQbesPj1vDbSx3fZrx7+nluTlZ8M5coY7Q1iAqgBpLOwfgj4LScyixa07iT32GpbEmehqMVXE/pRfF0OGQW9CeImD8x57gl0h6UDRAKLz08RBC84p4k1iaxrVzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=yoga54B0; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842848fd613so5578681b3a.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781091648; x=1781696448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/OnL6JJ4Nxkga19UkhGZJQzJPjrBwam/MjL34lQT2g=;
        b=yoga54B07IspapASh6tmFzZTT2l1zx5bTkqGtS2XzPELDxJ/KQSZCsHlwM/xKq6yQp
         B/EKHWv9c3N0Ob6vp672Unwbv5SZBMHPPdNIU0M/M+PCIWXfXY+3MhZV6TxPUqPfmNgc
         5bqtI2szPgoWHNw3I/iGyL3AxiwPxQ7q3wdlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091648; x=1781696448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/OnL6JJ4Nxkga19UkhGZJQzJPjrBwam/MjL34lQT2g=;
        b=oQRFOUq22Z7Pb03i9puZLOY5QqsO+5hL0w/rAK6Nale5y6DswVY2UsRSv2fSZ0KlnC
         bCSXE4tH8B4wx46NsRon6qTBPjjS6kUbV6GeZykBfM3a5+21p3OMTGGCuxkFGfDIS2tj
         RETUIvpwmg+lGZp+ErCzu2FEm4B7RSRyKpq61jSVB8wrGLqqoFTUCwDFNDR8zDWC6CuB
         QlnpwqUpn9vqXfJ2tVMDTanuk95Yyr+STwIO9O+gs9BCvrUsOsG5OwLHQOWT8KFL5ur0
         VNviBCvNSs7O0QoM22sBJSzVL8NKOPqkJQdfp5hpiTVRvLc2xDzF7ovSw/277m3+xJmY
         Gopw==
X-Forwarded-Encrypted: i=1; AFNElJ+NvfelDL5WCZukwLz2zLo89sT7A2K+4An3lMxe41o/RKskoW6rwRyD28aC36AYNOKGPR+ZCxFkIFIveQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw28goMDSXAe8TH0F1wkwW7bKPQ/lbmvkYhCtyOoUwKuXWIuwr
	iq4gYB6GjXLb+yCmxtqMwAzHtKU1AqmScwpX7oYmqy32n278JW37X/cE4VHuLkE6xX0=
X-Gm-Gg: Acq92OHxMrLsi17nuymBYG4vH/u0deaTL9rM0gsAQQ2TeECCMDhstmdaNRi1lISdFG+
	J/h0vwVJnGlxJcbfstCqC1YikoTTbAi1cdFRSv5Kym2HQaPKmJFZRqTJj2OjrV3WJcUq9iXoH3Z
	y8SRd/4a3v901MVUte+hd6snq5KsS/m/UEtEF8NTcwVjaHoYRgTM1mIosezhv2udHbiJg5sV5Nd
	nhfOuTAqzkfB7dbI79Sl2WYGW9K6DF+IDuwEoIIJx7WnnBdyDPg7/BEWTgjI1HoOhYcUERncg7V
	iEb6DgBczjuOgJ7j9A/K/qh6xYtLVd1BigYOX2Va0hqm/idldB74779Y3DH9b9+CSMqpzJ36KPR
	AZ0TX65keMexFE15RW/OKGmcNmOgEHHD4RdHSL3G6uzZ6gwtYHXkfN555I4eR3llzV1bd1IDt5j
	vt4UmAwzzrF9UHLYZCMDlWRvh7ZRU/EJUJYlQud0XCss0hNWpKY8/h+1Zlc06MqwG0Ssk=
X-Received: by 2002:a05:6a00:8d6:b0:842:329e:7635 with SMTP id d2e1a72fcca58-8430a7dc0c1mr8158307b3a.45.1781091648617;
        Wed, 10 Jun 2026 04:40:48 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm23133391b3a.43.2026.06.10.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:40:47 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: media: saa7164: WARN_ON in __queue_work() on early IRQ
Date: Wed, 10 Jun 2026 20:40:43 +0900
Message-Id: <20260610114043.721561-1-jjy600901@snu.ac.kr>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64422-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[snu.ac.kr,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jjy600901@snu.ac.kr,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jjy600901@snu.ac.kr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sangyun.kim@snu.ac.kr,m:bookyungwook@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,snu.ac.kr:dkim,snu.ac.kr:email,snu.ac.kr:mid,snu.ac.kr:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AE9D668ED4

Hi,

saa7164_initdev() in drivers/media/pci/saa7164/saa7164-core.c registers
the interrupt handler saa7164_irq() with request_irq() before it
initializes dev->workcmd with INIT_WORK(). If an interrupt arrives
between request_irq() and INIT_WORK(), saa7164_irq() calls
schedule_work() on the uninitialized work item, which triggers a
kernel warning.

The probe path, in saa7164_initdev():

    dev = kzalloc_obj(*dev);                          /* dev->workcmd zeroed */
    ...
    err = request_irq(pci_dev->irq, saa7164_irq, ...); /* register handler */
    ...
    INIT_WORK(&dev->workcmd, saa7164_work_cmdhandler);  /* initialize work item */

The interrupt handler, saa7164_irq(), schedules the work item:

    schedule_work(&dev->workcmd);

If the device raises an interrupt before INIT_WORK() runs, the handler
schedules the uninitialized work item, which triggers
WARN_ON(!list_empty(&work->entry)) in __queue_work().

Suggested fix: move INIT_WORK(&dev->workcmd, saa7164_work_cmdhandler)
above the request_irq() calls, so the work item is valid before the
handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung

