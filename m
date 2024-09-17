Return-Path: <linux-media+bounces-18320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB397AA7D
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 05:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1631CB29FF2
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 03:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E098327733;
	Tue, 17 Sep 2024 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcKOHQPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F91BC41
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726544543; cv=none; b=d8Plmg6WAiD2mkGO4jruQEtqdYPjYTTDLNiJu5ZsWr7IU9sy9sPiyVwosnt/ns16aNjmp+kCzVYVIlmq6kkZsT7xsjZM+H5XvRFL9g5COba4v9TZOgJNka9DrWyk7ey6j6HTn9+ddLw8aFQW/VnyaLHdF+JW1K/7JVDWoUSkAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726544543; c=relaxed/simple;
	bh=KXce0ex+flq39iG7tyrRoSCZpC3q7IbXfT+gAfDKhm0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ozjRehgNJS2l3ZVFEW4i2T5jJufHF0gT73ERqVKc45yxHESxKKEbGAz61vMSJ6wtnEHl0j8+UsMmXooc+8e/IBCZAmmwMhBC4a01zTnp8/TJ4Wwm1XfRww7f9uCSTVTir3L5oZS3ukdvhLr8UsiPeogxagMQau95BLKX67Qkz4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcKOHQPi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5356ab89665so5653217e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 20:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726544539; x=1727149339; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I8+ZRMKJz6tR3X7Wgj3FKb6WJ8SAcGypVKNmuvhwG0o=;
        b=ZcKOHQPiwIFjTiXH9WxnoXHZOtwGglh3WvCF/20RMU9slVPrhf3OrLFgUDhfkkUnQC
         YlY2eGWhjMlw856aXlCMCEIOeTonSVJE9wZoZdv1IxuTX8P2Q8dLYyka4RYJtGKJDzw6
         iaNmGwbeqJeaqRAIygMXO2C7/SJR1V3GxfmY5BH3qUxb9OWtT715wYK6ZoiMfIbvAisv
         JTJ2dzuOuEDUJjFOo9TrfJ2uCRPlnRvb/8gBLwes9HHSY3erLear2raGUEfdaAJy6W43
         R9A6FSLE24Ay22oj54msloQRaoqkrUMevYDTevxyHfLLNR5q/8nS2yjDpFUNJxKwDy+8
         T/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726544539; x=1727149339;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8+ZRMKJz6tR3X7Wgj3FKb6WJ8SAcGypVKNmuvhwG0o=;
        b=tbc7rrK4eWWlzekI7AKWdk8SriSlooIpWpNoHpKrVPVnttfezlitDjEdvTyChmYFAT
         etjckzu8N6bZ3wnHv5mZfb6L91R1yvgE8/6iDvjYvXdlOn9IN4k5sbl1PzQu4i6cnC0Y
         aAMmZRBGKqM7+DFkfUwzgGC+oQgkjeTcQjB+c51VNCvIDp4lT0RJNk4xF8HTDlRs4gF1
         Jl+1F7o5lpLuATXP2Y67TRfQGstRchCSYjcqsDsVyGMMv778vaRFC6aghNIR36A7+NMy
         TjQkSrepyz+JP63pbMAdD5cEIzbMKNkSpeR75OgX2RTs0N0UAYQ721neH7Wn2THIsLaC
         z8jA==
X-Gm-Message-State: AOJu0Yx93oaoA/vhh4hisuWO/v0kFGL+OG2ClLS5zyEQ4swumNqu1rAZ
	1sfIDhsLfBDm9ab3RykUnOUs78xVdGeMzhgAOqX+fJXpJPdX7y7vEDz8ArycXBxrU07DfrHtZ98
	ss0YQluyy7pGyGrs3AFGR9Hdahz7x9Tn/
X-Google-Smtp-Source: AGHT+IGjuB1l8R0j2zFC6Y/D5YGbOErJY+F37BcQn1U5Xc7ZO7yXE68aCfWKc0mikM0Z2Xc8ZqriNVqjeZj0ftk0FjY=
X-Received: by 2002:a05:6512:1384:b0:52c:e1cd:39b7 with SMTP id
 2adb3069b0e04-53678fb1e9fmr8639429e87.5.1726544538591; Mon, 16 Sep 2024
 20:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Karthik Poduval <karthik.poduval@gmail.com>
Date: Mon, 16 Sep 2024 20:42:06 -0700
Message-ID: <CAFP0Ok-pjOYpRxj8TbSgFgdQ6xT-pegd0b9uiM8LDhmu_WvZMw@mail.gmail.com>
Subject: Media Requests on Video Capture Device
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi All,

I was trying to implement media requests on a video capture device on
kernel version 6.1. On my video capture device driver I configured the
q settings as
q->min_buffers_needed = 4;
q->supports_requests = true;

To make the application work however I had to comment out the
following lines from videobuf2-core.c
 /*
* This combination is not allowed since a non-zero value of
* q->min_queued_buffers can cause vb2_core_qbuf() to fail if
* it has to call start_streaming(), and the Request API expects
* that queueing a request (and thus queueing a buffer contained
* in that request) will always succeed. There is no method of
* propagating an error back to userspace.
*/
//if (WARN_ON(q->supports_requests && q->min_queued_buffers))
// return -EINVAL;

Regular capture would not work without min_buffers_needed being set
and requests wouldn't work without supports_requests being set.

Does this mean that media requests are not supported on video capture devices ?
Kindly advise on how to proceed.

-- 
Regards,
Karthik Poduval

