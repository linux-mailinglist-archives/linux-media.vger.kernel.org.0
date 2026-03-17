Return-Path: <linux-media+bounces-56135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDmbL1vMuWmQNwIAu9opvQ
	(envelope-from <linux-media+bounces-56135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:49:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 248C22B2DE3
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE2B530A6924
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD43C30ACF1;
	Tue, 17 Mar 2026 21:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="Z4//cC2t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D4288B8
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 21:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773784148; cv=none; b=CJjEVoIhRrwnSOxwcOMN4l+HPue0lKkJ67xCjd7AP0GJFel6AZzW47K3JVezavFmGkGN+2k/mISZfHyI2pVhsGtnFR5IAfbyXOYFDu/xz9Y9b1xB5cuSPlkNqDvvnkfjBPJpN9GQFv+MhjsU4fOGCmnIXLXJPiJklxP1fOZoG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773784148; c=relaxed/simple;
	bh=4YNyIoKDC8t0xE6iFDuib5WdI9+EuIVg6rFSZGhilvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jn2xG/EaNmzP+Vfy17kHDeFIoHV/yi7/z23YNI7TL3cbdBXrF4Jk4BTFXZyPtHPDv6WREMGJDG+1gy05gcF7NQpwXwLRc93jFAFQgY0CYmzfs7I/BU7V2kELD0SdkMq1biepPAIlezoUMYS1nOSHz3bdahcXrWNFH1m0gTtCXA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=Z4//cC2t; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c31ca77b4so6707667d50.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773784145; x=1774388945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXOGzIm9FD8IGGhLUIWA5355XBZ51cvQSrQvlO2GfQQ=;
        b=Z4//cC2to2WPXCOjc7pPS8QnOukcjHk8CMcJGaPwKIdpAUJiuXeEdL0K8CgVaiBI2w
         wwn2Tlw+3nhH35GOtAgxJrCdzzRUKQBDPDV8jSP93UsZ7Ym/E0/h2XENXGNOXKF2Dlbz
         jQik9iOkUgvDEvsy3Hg3JAfOEss4dVrRVKgEkE0pmNVgaFTAIFVyH8YeG1+RnYn9E5h9
         Aiy50vOjyR0XSX+W/DXdrgCpL9dVB0Z1I/7nCJI0xsABx1V7TDv2EHmukJ4DaoqAOu3M
         wC9KpxA8WI7TDwLglWoMLhCkYto4odCm8vzqtAMMuDkPcJIVprta/NLW+aoSIs3VJl5R
         U9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773784145; x=1774388945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXOGzIm9FD8IGGhLUIWA5355XBZ51cvQSrQvlO2GfQQ=;
        b=JbFMSkUUgEbShUke5e/UmtlSW8xZHIWCtLh8KKHcY4f8hH0DJC9D3WZ/R1THowSalN
         oJgEYpgHEw97kt5cKppPgi6t986OLCOScFm6rIdkGs4eZpScAv3e4TcnSMNWfMvZLTeW
         jGJ7RYVkqfBgJQ4e0TAlEfrDrxfqG77FW847B99o9twO5BrtOjCZ0XvSWNbu8/cZnhnt
         4wg/cNAVFP/dlhg1DvETZzCsk1U1/EcRk61UkXpVKbXnN/zh5QKqJPL1DywzAVmFMj9c
         PKBN0X4OgF4xzGjHMsWUv8UwovfgjsuDmrnZUcLAZvmRltq9e1nII4IaERJHTjHQKP0v
         Kzdg==
X-Gm-Message-State: AOJu0YyRRyySDok5rNRrZs9F8KbUfSuterV8zek2Hm3Rjju3CPrX54Qm
	ocXKqYtxUy1ziK9FVgx7F+a7hZETWY97Hxmx01E9QMXjSy1DYLt75GeQNf/3coecerQ/8JovKN4
	ydkfIrWg=
X-Gm-Gg: ATEYQzyGZ/fYh5j1IWrHm+IgQFwhwVDH64sGsgc/Q67CLVU9ba03cNbOfdXRYnYyQ7H
	EmHi22opawlEpYdjX+NxZUPB/EK29tOcD8XpoDc0bL/ht21YPs20jwg+p8UDI6iQSZn5CboSqu0
	PiMZtyPt0Or3zj7LPf2NL7b7o3xCbn3bMMVq9Q62EEHc03kKEYB2zUOfhKzIfSUd7hMskjvQR1q
	bs1gMt3Ak7k+YgmxU/rJqwIz0AThh9+kj9hNt2+e6ue2A5JUSy023D/nFleQt+yujQmrD0nPBoV
	NU/rEjBJAF8iOGD72bKnGx8QMb0DppDbyoSh3mQ5wi24C51o4Je6z9odMOfGdgiwLDOY75BfMFh
	rWGXCOeHZEmoyP5+NVfWIoFHIGq9O1l2ka/G/mtXbUGIwH0S/j0U8axGYefGO2QoQI0y5IpojO4
	31A04s1avcoObzMMyg88WfhU97lpW01BeirjhOEjlL6iEy41cvc+BAuvXti3eVZ6593aGrPqC29
	IY4p9hRRnu6ljM8YJQ=
X-Received: by 2002:a05:690e:4243:b0:64c:46c6:d51 with SMTP id 956f58d0204a3-64e915b92abmr939482d50.57.1773784145535;
        Tue, 17 Mar 2026 14:49:05 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a1c4b8sm566144d50.1.2026.03.17.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:49:05 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 0/1] cx23885: Disable analog video
Date: Tue, 17 Mar 2026 16:49:01 -0500
Message-Id: <20260317214902.3369964-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56135-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 248C22B2DE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is already the ability to disable analog audio
in this driver. The attached patch goes one step
further and allows disabling analog video entirely.

This helps on some modern system which can cause
glitches in the DMA engine relating to analog,
which breaks digital. These glitches can happen
even if analog is not in use.

I'm just throwing out this patch out there, if it
is not acceptable or could be done differently
please let me know. Thanks.

Regards,

Bradford


Bradford Love (1):
  cx23885: Module option to disable analog video

 drivers/media/pci/cx23885/cx23885-cards.c |  3 +++
 drivers/media/pci/cx23885/cx23885-core.c  | 15 ++++++++++++++-
 drivers/media/pci/cx23885/cx23885-dvb.c   |  6 ++++--
 drivers/media/pci/cx23885/cx23885.h       |  1 +
 4 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.35.1


