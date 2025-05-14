Return-Path: <linux-media+bounces-32532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A674AB75B2
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 21:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F9716CDB2
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 19:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B179E28D85A;
	Wed, 14 May 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4xNS0wJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2E18DB2F
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250436; cv=none; b=WJawg/x1oW7X7sWCEZKxoAxG3r4+hLecD76so1KgHqlO7YcAUID6EvzNLCc78dbK6MgAsivzrEyNLecSSCrVUbdlT019zpaOfixrf8/QCMJ5ttCB4E5fwMEkTizdxABHsncc+N1jmvIfYDnl79ETB5dwM1Sb4cCCFLPEg2hIOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250436; c=relaxed/simple;
	bh=tGbriKdD+BR+PHNkEv726xL4Y3k8Yzn6yqJnKcnUdhg=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=iW7HwACUb1aQe046u8U9epd3/KBKcu18rv3dt55SicpqwiidM5wuixHEB0SJDQoa80x+9X9NrbDY3sdYQ99BGTHDFIpOt17WQPqwCU6Loh7EiLCzpUZRiL5Byze/uL9km9rubpzNQ0gg6HY3sMjnywx+f3gRyaN5BmPNuCw2KA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4xNS0wJ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4767e969b94so2888301cf.2
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250433; x=1747855233; darn=vger.kernel.org;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGbriKdD+BR+PHNkEv726xL4Y3k8Yzn6yqJnKcnUdhg=;
        b=Q4xNS0wJ1dCcbWsC9tsFvwBJKOVaBSQpwa7MW1zcYNAcAkeXvVztL9xtMCVqsqpCwy
         fHSAJyPW2LooowdPsLfSWl1B7N+hFS9KX/urT9werPwrwsgJe0PEkFD03sRfXeo2rYLt
         Z340vRl6Kyqzm4cxKkXBiqWLmNQkonIk0d7Ex1J5OVcubNeHx2t55LK1KEkiByF0D3TZ
         Comr3StKke2r7xZ6p9afObrUl4UcH+T0V7OmCsz1JE88yr/h3J0NPW233TD8mSjAlu2G
         8qjewSVVxN6J+BAoAmKYplCucmIrlLSAixLvoECrr6fgvsqXmojVrbc+c8/4N/wGabIq
         PwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250433; x=1747855233;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tGbriKdD+BR+PHNkEv726xL4Y3k8Yzn6yqJnKcnUdhg=;
        b=pfrjsQgzz+ACXVoii8X7uRRoIMB1eXbveekhRhNKKdyS6VYzioJXBniHLgeQC+RiAG
         ujjr4EfbcZRwulxpVUaZJmsJXesRpncLuKQX7BmgQ7el85o5n1EwL/nnT6eufGIo5xx1
         mTOQiJ4gE3OS7O9Wnz1Xz/c2/lXF5lT0WdiG1RDPjtY32JybGm26D+GSAyNuFg6HbJCC
         pOPugp1466r3pJBJ9D5LgXt1lLwOcxo0l7CQCai09cE8wAPuxhHnsZN9Q8dQAsVAjZLf
         dnrmlyAlsJm2HDIqNIZ+KbgjHorl6YCw1nhTOCOSiMzmdrg5nAhxNnnfhX1JWe8zICgy
         oD6A==
X-Forwarded-Encrypted: i=1; AJvYcCX1I5GP/6Jxx1O65zXKLuqBLgfOf6uAPgOne7ObO35SPNRjtBSytSa46RhUAIZqEGNu8FSp0gWGu3Izzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUHsoV9V3bF/KZXNqWbKObRFaAe4ikY+a83rGe/J8nbLtuV4A
	o+81RydD8dPbS29dWmoJr4MZTCGEeW4zaDigFigXmA403F+gyLLY
X-Gm-Gg: ASbGncsL4/pg1Z0fXo/xiR83Yu7ZPqwrYJFK062KYM9AA3RY7Irq2BKUj72XmuqS83d
	i4PqEh8ZUOb8ncYjVyg7W/+hBhpeqXpbZQVP9YAHKy5ojH+Ih6KHnhl8hlEYrA2DCHJ3J9k28HP
	hIw4xcXpSELRLRkN/GUU2KQEKFthw4JRGMMv+eHnTwBDyTkXHr6M+Jyt+ruVmcwEGgrRdmvmJZ6
	WlGq4IuFRyzmB88u5uy75iX0dhnMxPsr92VUY0tVxNecIBhiMZcdBNyFyJTm2UGygdrblgI45IH
	zd0hwA3voNK07Aunu4cXQ57vWNnQFASEs6IKbxaFIZZiR0D+2gx96M2ELZ+2FU5PKJo=
X-Google-Smtp-Source: AGHT+IG3zuKrMJnpkAsdYGvLmGka0ZkzP7XDEskZ3C4dkYbenwj9xVzZJybJ190VuGqi4l/V1QNopQ==
X-Received: by 2002:a05:622a:5915:b0:480:9ba4:3022 with SMTP id d75a77b69052e-49495c7aff1mr69520831cf.17.1747250433206;
        Wed, 14 May 2025 12:20:33 -0700 (PDT)
Received: from smtpclient.apple ([209.171.85.85])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452587ea7sm82722341cf.51.2025.05.14.12.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:20:32 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Mario Bergeron <grouby177@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 14 May 2025 22:20:20 +0300
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-Id: <7B9D4FF4-4174-4DA2-AA77-ABFCEFED23E8@gmail.com>
Cc: kieran.bingham@ideasonboard.com, libcamera-devel@lists.libcamera.org,
 linux-media@vger.kernel.org
To: laurent.pinchart@ideasonboard.com
X-Mailer: iPhone Mail (22E252)

Laurent,

Just wanted to know if will be possible to attend remotely ?
If yes, is there a link ?
If no, will the session be recorded ?

Thanks in advance,

Mario Bergeron

