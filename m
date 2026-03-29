Return-Path: <linux-media+bounces-57488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHBOMDjFyGnBqQUAu9opvQ
	(envelope-from <linux-media+bounces-57488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:22:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23352350ECA
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBB70301E3FA
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87BD2BDC05;
	Sun, 29 Mar 2026 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS1oYAbn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AEC481B1
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765360; cv=none; b=LyTfsTmCDvRISP8RK7MYb5oE9omWv2jGki5cLSYKLLlY9u0vIQnIDl4cwW4wzDxoQr3UnPVbtXbR6NwAmwMJhG3Z3Xxeay3gP7A/EjEw4Gjx1vgHCA5n1GPBsSXtlis88xkhKw885BbnuMndbS6eU6JJCIdgKEugN42kxxlR6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765360; c=relaxed/simple;
	bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ahXtZNQNHYY+xzuDr5rB139IcZfV4i2TZkbTq75PwHmqJd9xzidnjNRXQEFBRaGsCtOChRnm0QWojS/YdPXXPWDUPcRhaCKnMVYglp2cbRsb5rzjdbJePCs0k5V/2a7mMTow3+v6zySWZdVA2+Vk4cd641aHOxtwxB6p0NG9yrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS1oYAbn; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56b7043c97eso1395401e0c.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765358; x=1775370158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=sS1oYAbnPE6NPxbc21kN14yQa0yrx+05JV48cmERsS4KqDtu5RMYzJHKYThjSTW0z0
         1DV+mDCbUh60+TTeFQlThrBrvRzx42EnQxejBddLdO2vMa3yyCqZQPpk3fPX6uXlTCRN
         iqhWhsxhJus0EcI8nzMA1ho9IrfO37dKSPcb+sJxtxEPrLA9jGPf4/qqVulzFVUlqnNU
         SebeIRPn3CTUlI2/ROzTXaXWq3AM2exx4qWnl9OAvFK/EiTBGbWoIaUj3x1/C4V0zeWm
         f5tTmVby35XlBf2i9ToMXJcTTKFWEdcUKUhKuHUdzBiyNogej+CimiHauP0r70/xsRMd
         zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765358; x=1775370158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=i7neXBabqr765t23c222WJiRa2wgTbU1PMoGOvXHEtelPscjxfq8Hp/7ijkpGCpcHN
         Z5uqpX20zgM85axM9bjpvDNiM3lQA8nWt2vqbBfwzk/OoCPdB4ud9SfZcwHNJjYalhqz
         ZoTscxa3hF2wyu6PR4BnxMmh1yealXbHg07bebXfJeJu5pldE7GBT+37S23oRqHbhR+q
         sEiv9Mla/ANbtt9jdZeX3fsbRg8D/xJcTRS/N8+8PcoF/rvktdnJiaxAfZz/0Sd6KIwP
         tekB6EUE76FsSEvy6QLraDmnwME2JQ4qIinPXGVXI/dEASqTe915PmxXW+CFNJbt4yKc
         flSA==
X-Forwarded-Encrypted: i=1; AJvYcCWShhhQsja+T64xPwyJ9lxIq22u7rI4lhGS0m03FBgxmukCoz0CAaHv4ZfsAMpT0OEE5drLI/8PUhmaWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFHc+oPhWeGOH+plgl9diR9zD81sJ5zQXyWG6zmBHXYzhTtLuk
	7flGcMFIpcZF5mEfB755Kv1BT2YriwjyWZ8a6SrDRsERfH8oVbUMACJN
X-Gm-Gg: ATEYQzwstpDq8uSu0g3SilmT35hF9t+rUm1AEWOPaIAGKs2nGCBBS9P2932kTP0GQk6
	5B1QbO9WY5+wldIZzLWKIYPVqx2ykytnYBpWrhhuOJwL5ZcxpiQS6cCGnngwiqf3h/5S7l48iF+
	w2dVDZIL8d6HsN4uQ5cSVyrj9V65ytQMwNIOKaO8YPQ+j1NtPUxcsiDsoWDs7ufEUXPZHqoobfK
	59bJV+z9a+zngZl4A/8fbmzEUBPF9XaDK7NvzBXbMcqiXpzSadIOxALptGwj9rMvDbEY7dc32ZI
	OjcX9N8l0Zlc4B7fO5PTnbIodmVV6zS0yFnocHUGAzoANriaQsYeSa91npy2T83IxPqDtZMVEUb
	xgt8IC1AqaZafrzCxlRXE3jB2V761OxZPH1FMxFon+QER8h77y5Eb5BsX6hxoLtnlj/HQzzsrmY
	G4idud6YOMUY4JqxjkKZYwkSsP
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3209523137.3.1774765358333;
        Sat, 28 Mar 2026 23:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:37 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 00:21:10 -0600
Message-ID: <20260329062229.493430-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57488-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23352350ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes four memory safety issues in the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Patch 1: OOB array access in event_to_host_cb()
Patch 2: Missing buffer size check in inline_receive()
Patch 3: Missing bounds check in port_parameter_set()
Patch 4: Integer underflow in port_parameter_get()

All four issues affect both ARM32 and ARM64 Raspberry Pi kernels.
Found through manual source code auditing.

I would like to request separate CVE assignments for each
independently exploitable vulnerability.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>


