Return-Path: <linux-media+bounces-21067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97F9C08C5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33862284661
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B98212634;
	Thu,  7 Nov 2024 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRgUWMGa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDB5212164
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989333; cv=none; b=Tncev7BlhzQzE1ndnZY2IqvwUSp6kBG4j3EyfsCJ6/PKZB+DcbPLjpn1Xy/V2ikPeOM/55Y83VevNL2BkRpHv+t1LDmHB1/lQxbhl8pTLfP3FNh4NHAaeF0T6swJ4NlPZYLLC7LS8jHA3+iZZ34zioCMRS+ZIw9Wz+GSGaJYkLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989333; c=relaxed/simple;
	bh=msNjCs12X/k+cU9paX/rG18lOVZOD2w3+gINOeCCEFs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Hny6R1QhHpu0jmZX5ffWu7JPxPm9eKntfIYTavROZZO5C4uLMMVMp95oqmpQBFYCJRooOs46Qa/y2w/guOzNQdxoGEiSxKhOnNU53RDRasUej9HgVY28EqavrZPBYHiSQ1y4B4aS4DLYAmNpNPIm4yRGa7dHy22uqspVo06aX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRgUWMGa; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e9d6636498so19180597b3.2
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730989331; x=1731594131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kBwu8xH2bciKxRzumaIwOewO4Rk4JfaBGb+GSb2otms=;
        b=NRgUWMGavuqN0kXh9fGgtssusOwOSPjVo2VDc9NVuyWhAmnSIS5Hpz5siM0yYI+j+y
         HVHT0RW1Nam00nHfifoHg8ZWVl6/kh++lSy7Wn4jcl4Ukw485gKOuzQ3L+35S2l6TOxp
         jpwVAy+bax81hj3YB+dZXukNmkYYuk4bOCZ8TPRU3V9VPB6IQq44PIcqWEPgyhTKcvty
         QdhL7OZlxxW+P/4Kl90RAOlW0pGXyc2OZAh59c6ysH1G3knVY2+kLPF3aEZWu/UqtRzQ
         D0lyQdj8cgq4Z3cldWRFG87tsqgkDG6L0C6C7SNRKjmcFqqd2cOomlZNI/mpRRjcSoNa
         fFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989331; x=1731594131;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBwu8xH2bciKxRzumaIwOewO4Rk4JfaBGb+GSb2otms=;
        b=IFvJKji3N2jEtVce6H+xlPLer+X8RmaYKNf88mvSZ8P+CXL7iWh0HSkgpcqzufpSxa
         MKyqmqLz28L6OOYADggpNgC/ediMoHhr+B9mokRY0CGfXfiM+OwLmOfZLUHPJFDpdTIM
         6QpfrS8eLRUCkVWLs56Rg3BI5jpJYylsu2vRXwYNKuQ11LvSFdvtfszgH9F/h0V9rAmt
         vKH73a1Aqi2XqeF+LLTgl00eUpZQyxIIJZepDNoC085vsSaw6ny4dZNNn2LLMWbTxtQT
         /1sOWtWFrSsvE1NNrGYIieesHyVhnfCimPPFMTuUq1drLzmzB/v0eLvdyACn7FkTm5HG
         rNKQ==
X-Gm-Message-State: AOJu0YxPBLeR1rTYehff23VQmjKwNXTPjoJB0fOFOSoAIK7YuQBTdwRj
	I+TSRU0m15hRzx3NPu1aqz/kjcwBNLZ7Eh1Qv7Dh9Z5GXys2n68KVNxPo/JS5j0UZYtHToxNSpd
	fgjabnA==
X-Google-Smtp-Source: AGHT+IGvKAheswKAO1B6s1eZ3vxFbB6Q5ZcVlCzrL77mi6x6iewOG08K65z3j4rWnlVr4sTO6psMspEglklX
X-Received: from bsevens.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:22a4])
 (user=bsevens job=sendgmr) by 2002:a05:690c:4:b0:68d:52a1:be9 with SMTP id
 00721157ae682-6eadadf0e06mr2107b3.1.1730989330983; Thu, 07 Nov 2024 06:22:10
 -0800 (PST)
Date: Thu,  7 Nov 2024 14:22:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107142204.1182969-1-bsevens@google.com>
Subject: [PATCH v1 0/2] Skip parsing frames of type UVC_VS_UNDEFINED in
From: Benoit Sevens <bsevens@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org, 
	Benoit Sevens <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

This can lead to out of bounds writes since frames of this type were not
taken into account when calculating the size of the frames buffer in
uvc_parse_streaming.

I am proposing a series of 2 patches. First patch is very small and
fixes the issue. The idea is to have this patch merged quickly.

The second patch refactors the code into a new uvc_parse_frame function.

I do not have the hardware setup to test this out. The second patch
should definitely be tested.

Benoit Sevens (2):
  media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in
    uvc_parse_format
  media: uvcvideo: Refactor frame parsing code into a uvc_parse_frame
    function

 drivers/media/usb/uvc/uvc_driver.c | 228 ++++++++++++++++-------------
 1 file changed, 123 insertions(+), 105 deletions(-)

-- 
2.47.0.277.g8800431eea-goog


