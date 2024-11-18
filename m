Return-Path: <linux-media+bounces-21558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA949D1B28
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 23:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71147281D9A
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 22:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5601E765B;
	Mon, 18 Nov 2024 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIurM6Vr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C814E2C0
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731969506; cv=none; b=il1r+jns7MizhYMhY3JmNvWG1ztPaLtu8zHEy2eBPvsq1Kj00vF1lZSQMZhdqeoIh7qHWJEYMcM2LqPIgBlv1DSAzk8UrSZjPUIxs39chrUxu07wy/nq/DfZ4xop6ittx2U6+tI7zjdamyalqI/wMVUTMfZavE6L2CZ7wlQAVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731969506; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=OkC5wfHNOoZfQ6QZVGTqJUT/lhjM2dIUC73eMT4E3Tx3FBDobTN/6Je/00tX0pVS85PYZ3CM+uAz6JZBzqin3rVd5ZzEKWTK1JD3b3tz0lJe/MRiDWXQjX/zi8EKwBOVGDx1gB0J9DxwjoKGn4yhsG9RatREsvhj2pmqGFBmqoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIurM6Vr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso36442935e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 14:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731969503; x=1732574303; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=eIurM6VrStfbxKzwAzvn3eq6kCpv033Mls45Ex7IGf4p7CjHvIbtrf/MxGFV6nawV9
         dnz45CY+cSGPjPeoszRJ/58K0uC9QixtZV1dHvS1qas40YDGEaZ83AvhpVzx9ZF3Q6UK
         zIOervxW3Q0j2gYEeRf77uLbq4qaUdtBd61TZvFjEDeh0zCf8que4wbf/6b4whzYYU9Y
         Is806/yUJlpmByruW6RMU+UQ5oUlw/dOvpt9YRPXQrs5HNEciYmMs61Z8blSpoTonm0E
         1fSjqQPoUDNuPG7Nk+qVF2Z0bVr4f02Tfw/DHSLs8XD+TUXPXWnBqVINmjO133vxAbpf
         R6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969503; x=1732574303;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=BfHl6T0xojDbLkEBCokTZ4ZkU7AkFNt1cSdGX9riaHLKgz8lx2jRU3nrWX4warDgaz
         k6l1qRgwMR+nYY3fbEWuII17Px1M3gAU3RxtyrSbQ5GM3VRMWqBIxblYPnhBmLRXlOIj
         jRoXWvp1+6Ec9KnQpfHdy4oYZbM5CtF0vFQOjttr2ufUCeqzGWKbppobB6jp3AIVmRRG
         xv3qpfiWpo2WAlhNEZAXjqwhmheJwsM54PdvYGenVTzbaaAtIzDOb/5zfM3czWAV6bUr
         v7iGW8gV9xOpY/Bmv31BIox1PXgO6XxlozxFZ2qjUMIfshlQZhFuuRS8IqxSp556Nr5L
         fdPg==
X-Gm-Message-State: AOJu0YyXK6/RJOgx3zJfEZvDyhgrB4J4Z+8CxMM3IySHf0ecXtkxWhq9
	PUmw3yAJ/5/gvhmpNJo2lJXOEpGjRBtlkTsvsvXHzOL963/z/dqjvaIGDw==
X-Google-Smtp-Source: AGHT+IHTtonpHx8qkjl7P4E2v6tfEr9CxeeW0B2FHaG/meV4HY9ejvfqL9wuFoInTxdHxWv8dlaMGA==
X-Received: by 2002:a05:600c:1da5:b0:431:5c7b:e939 with SMTP id 5b1f17b1804b1-432df74fdedmr142715035e9.18.1731969503235;
        Mon, 18 Nov 2024 14:38:23 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac21b24sm168938235e9.40.2024.11.18.14.38.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:38:22 -0800 (PST)
From: William Cheung <annaisabellaytf@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <8ffdbc59c03005e5ef040e37519a3d7600b4406829c5aaa7a2c2a4c1f8e7f2ce@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-media@vger.kernel.org
Subject: A Proposal
Date: Mon, 18 Nov 2024 14:38:11 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.

