Return-Path: <linux-media+bounces-41885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A9B46D13
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B3C7AABD9
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 12:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBA72ED84A;
	Sat,  6 Sep 2025 12:54:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4282ECEAE;
	Sat,  6 Sep 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757163243; cv=none; b=SfDTy1T2+BHD26rOoHAwLPeqBQlLVCHMw04QPRo0qoZbVE6aJUkAEne9209wzphJr4A53CfFTIFKQ3JL7H46sZKzNMNyqljHYUKIZUcc1yB53xpxWbtDRt8yYQAfAAR4OZH+korT6T1ZsPIxBhhnHFq52bkXzDfkj/8kV+HmtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757163243; c=relaxed/simple;
	bh=bMWnIdPIuLs8f+AwFZer1aNYdwbjKwIKbxoEOyaxKpE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KT/5pmBrmDAg2Nq7bBTGysHVGPW9uD+vLnvdqy4+8fsHvZu40h/Lj8lB0ZEdj7Ga6EOTHDgvRhDweGwgvHHq7CtkLG3wwHn3yNt4jQVbAwLk3jM9D20vo4KN/DYjwiG2+F9OL9mxGAtpwMhmL0c5BsurCtRuuiLWd0cGsnkLbLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24b132bd90dso5710705ad.0;
        Sat, 06 Sep 2025 05:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757163242; x=1757768042;
        h=content-transfer-encoding:organization:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0a77094FEb9GuihsWwkaplZsNtpOCd+IdcCOf8V6GQ=;
        b=fGn3ZZ+eZ74jOBAEOpG3lqjean6B0Z+S4y2/S4Nl3yNiQ+50HcTLxQW7Gun6vx1E00
         /OM4+sBhWFBErH29Ew9/LdGkXGr8Gry5cL6lDay1I9P2KEm5k+cZj6RfnL//kgRKHa2a
         naIjyMduq3nwg/O0sNytsgAi3S9S+rIGO6YXCjbeWQl9PzWTYRKFFFSpQXP5suvZ28ZN
         kvkMUh0vpJuZ2v1S6M/Q7mu4YP8KH16XtWHFRyUK7Yn3fKb04mTgLIK/qnwkbmZjUdS/
         TTOo9osDB8xHCQ8IlWu2encdnZaQeusQmUgKG0PhZQ+VriLMR8SRxhz5j8MDaxLm9npv
         PTag==
X-Forwarded-Encrypted: i=1; AJvYcCUywPt60nUBhtuQfvM4lSBOw+q0BEwF7SIJWpxvBC3fkteVPxZ7X+YDT1Duxuf05XTiKF3zfAKUmp3UWWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Fxmgttbf/4wEOTAeIMx7yzeDHMD+pgjXIxysQxcNdJvvDF4b
	lwt6pjj98lkfd/rxeVBfHm2+cc9bpc078Zkne8WJkZxuuMrUPcyOY/SD72HHMQ==
X-Gm-Gg: ASbGncslEP/ZHLpyfGTtWz+4QFxshWjRhKL33NsaIJ4NpFre5xLoVCh3wqE9riGic5a
	ZtdDjawUsNRuwWMFT8qeg4PhEbTKGhb+dIM8mwEQF1GuL19uBS+CBw14s91bSOWzhSIhZy3yPFu
	+szbed9JS2prhbTjFHQdC6vrOkLYboijDra4cNygbO//BPitTc+wLStiXX4zeJGUzdVXE3+Deus
	0hPEBCfVoEgYg3pPszHtAUq6GFx8aIBnm/NiUwPTZIHoQYcjz9x04kwUUmzz9BiHOv5JvnCZEDf
	+3AA4MpMxonA2Gf2lrWYOgnKFdEYknT63oP4kJTL08fUik87FbesDXMKuSaOei1kKpPvjgvRfc/
	47a3XbFETQ0sqCIWyVtt5l+fVaV1dmHMT5yMLyrTFewBI6+qTTsMx8ZJtLj6lTt9iYnRZmRe3cX
	zQm0pfq7iO3fEWB+DsAegZHncS6VlD
X-Google-Smtp-Source: AGHT+IFGwSZz0peeD54EP712jVZpITKjp33SOOjG9lEoVNMZoDPVwbepYGSheS//hzxTlrhv9PHwZQ==
X-Received: by 2002:a05:6a20:938c:b0:250:d384:e5aa with SMTP id adf61e73a8af0-2533e47d8e7mr1732567637.1.1757163241494;
        Sat, 06 Sep 2025 05:54:01 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4e5684da06sm18491830a12.17.2025.09.06.05.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 05:54:01 -0700 (PDT)
Message-ID: <aaa302bb-b80f-4409-b274-e857d91f944a@kzalloc.com>
Date: Sat, 6 Sep 2025 21:53:57 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From: Yunseong Kim <ysk@kzalloc.com>
Subject: [Question] __u32 rangehigh in struct v4l2_frequency_band to a higher
 frequencies value
Organization: kzalloc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Mauro,

I have a question regarding the data type used in struct v4l2_frequency_band,
Current definition:

struct v4l2_frequency_band {
    ...
    __u32 rangehigh;
    ...
};

According to the official HackRF One documentation, frequency ranges up to 6 GHz
are supported. However, the rangehigh field is currently defined as __u32.
This means values above present 4294967294LL cannot be represented:
 https://elixir.bootlin.com/linux/v6.17-rc4/source/drivers/media/usb/hackrf/hackrf.c#L67

For example, the HackRF hardware itself can go over 6 GHz, even though the
officially provided ANT700 antenna only supports up to 1.1 GHz:
 https://greatscottgadgets.com/ant700/

With a different antenna, it seems feasible to use HackRF at 5.8 GHz related
discussion:
 https://github.com/greatscottgadgets/hackrf/issues/1274

Would it make sense to extend struct v4l2_frequency_band to allow rangehigh
values up to at least 6000000000ULL? Or has there already been any discussion
about changing this field to a wider type for SDR devices that support
higher frequencies?

I tried searching the mailing list archives for discussions on
v4l2_frequency_band rangehigh but couldn’t find anything relevant:
 https://www.mail-archive.com/search?a=1&l=linux-media%40vger.kernel.org&haswords=v4l2_frequency_band+rangehigh&x=0&y=0&from=&subject=&datewithin=1d&date=&notwords=&o=relevance

Examples in drivers:

.rangehigh  = 4294967294LL, /* max u32, hw goes over 7GHz */

Possible adjustment:

struct v4l2_frequency_band {
    ...
    __u64 rangehigh;
    ...
};

.rangehigh  = 6000000000ULL, /* 1 Hz to 6 GHz */

I’d appreciate your advice on whether extending this field (e.g., to __u64)
would be the right direction, or if there are other considerations in
the V4L2 framework.

Thank you very much for your time.

Best regards,
Yunseong Kim

