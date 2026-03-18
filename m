Return-Path: <linux-media+bounces-56166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ8BOyDuuWnPPgIAu9opvQ
	(envelope-from <linux-media+bounces-56166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:13:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693652B4934
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC5C3152F60
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 00:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2E270830;
	Wed, 18 Mar 2026 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrsEcCyC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2E722097
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792668; cv=none; b=no4EG6eMMhQTDnLIbyehZdsXjiAan7U/zIKs2ifrLtI0GYSIP6gnjGqEDyLkC4Mk0ppTR+AHFjRy9f/80Ls/UkJaCchHEGZVA7+4/IOqz+F3rcu3pwozX0ujDs8E3NB0FDyfLBN+7Cshj9UGzUb70o14rYOLod3YFukho9RjR+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792668; c=relaxed/simple;
	bh=mJOh4+TUquuo3oCazHAl5PxEDHbwHT7LbHeJE6i0URk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrIGyKTRJAx984FaC3OWCfPNPLJAWLK0Ab5MHbx22L0h+6/yZK6n6lEYmfdtizD91y0SNKtp+apXfZ038oRL4c14bCagK0An57wzfUesphqrQMeVGni2oao3eZdNKWf9+4IzQadU6f9LmA5djic+IF05YPH6okwEQO2mt51WTWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrsEcCyC; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d743ba241aso3376367a34.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773792665; x=1774397465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/T1BD0jg0KIH8vy/0fGwQbZb87lWT1u9C8syIgmcMI=;
        b=FrsEcCyCebh2CFkeG3obA3AieQQtKclV/NUhkowUPDsiGyu7fk3P8SI0fy0AbGw2Vd
         rlKjLM5WKFDz7rdT7k9ZSZO8euHpxU1s7TAecW9LeA26JFygA2NLq1y3pYG9kZzbztBb
         /stcYWbJN4+CTYJRsDKps9w+L+cHbPx39dQUssG/227NugyryLp5/6pr1DHlNGfUKMsl
         L9+qh91EcHuqRi4zYE8fiuJyU7jzpbu9ReYwRmPHRv/lYtNUrhGsDLhNz4eqRCY1uwVY
         JIh03+u5AHDspYvw5P0pNQwzDH2l65ylH8xhcK2CRo8CIeUDSfZTuESQaVzUqVOLHIXr
         TtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773792665; x=1774397465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/T1BD0jg0KIH8vy/0fGwQbZb87lWT1u9C8syIgmcMI=;
        b=jhds1Poh7kLvY5YhK4aPWPeNTM0cSJpVo2zzcOy5aDmmZkPpLNCEIIyzcsyDApHRSZ
         BYfht4Sak2hypImaRNVrCVAgRMxOfoML8w8IM5rwad0A6wxqPfNts/Hq5dJLZs7kUjZ3
         1BuLrqWUT9w5Y5qvYfRMbXwGs/BzsBgE3+S0dkAL+2Lcg71yYD5Jdk06lKqSTOH2IVOt
         EoiKN73ShjxNlCe/jB6jzrcf0Ytw2S9N9Ff1LhfiKJSxqkuyfhyfzCuC83QZz46mrGTp
         r4QDrh63CMQxpRl04gUdHJ1o4GRNmbsNSKSE/juXNrr5WZMjdHHywdsAx67MppcZ06Lw
         tWVA==
X-Gm-Message-State: AOJu0YzAO/hJj2gCEl3c98qbWYfv4N80nu0brTre+0rp/hcrwk9lJt8h
	tfhHZlLqspqP0sEVUw4tVZKGvZSbFdxO8DJrdEcn3BQzv3JK54YnMkUa2co9Cxvp
X-Gm-Gg: ATEYQzyLwoDGf63kpshy4MOw3IRyCMMpOYNpvCTXX1WfLWORrh+SXy079hmPki7WYUw
	XYCfVn9Q0zhDod8EDJKncChVnk9iAn/b/HyfoxrQD8uxNTcBpHOWChG1zrtASk7Xfu/3aYPoqVh
	05Q2+QCt8lc5vZ6t+FAeEWt1fcbEV9kHg0om2neQdzemUHK8PPZLwWtkWNVE5Ev/5pwYnnfb3/m
	JHWOCKHSHSFuQ1803mnph2lrcmGJdh5tmsFbTt1UFpbHljDRuUzUj2/0/8hoxDquKLR620iE/zQ
	tUJNPl9WlKwcn1exdI4e6GYnM2zhK6XQ/3s93glNmY+rO5X6slB0Z5n6L6pMRSzQKsrJMcwKsJH
	7LX6qXWfhz2U9CCJu8AU4yPnLkzehHDhojTVP8Akw/IzAo/KDB9iqCy9ETu72oYySZDZ+4V7Z7x
	9EfYF6sbFCcU2geJvE63+ONWsceYD/CjGb5yR9NvC6OMzpIjjePGREa4Aglfrw2ZG81/KIFf1Q
X-Received: by 2002:a05:6830:498b:b0:7d7:b680:8e57 with SMTP id 46e09a7af769-7d7ca70f5e2mr1051418a34.16.1773792665680;
        Tue, 17 Mar 2026 17:11:05 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9b39e11sm897413a34.18.2026.03.17.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:11:05 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add entry for AVMatrix HWS driver
Date: Tue, 17 Mar 2026 20:10:54 -0400
Message-ID: <20260318001056.465071-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
 <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56166-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 693652B4934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the maintainer and file pattern for the new AVMatrix HWS capture
driver series.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7241695df96..71c5d3a575af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4278,6 +4278,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
+AVMATRIX HWS CAPTURE DRIVER
+M:	Ben Hoff <hoff.benjamin.k@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/hws/
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <caojunjie650@gmail.com>
 S:	Maintained
-- 
2.53.0


