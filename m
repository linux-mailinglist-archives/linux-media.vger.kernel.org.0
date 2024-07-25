Return-Path: <linux-media+bounces-15351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E893C94C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 22:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E1428380E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 20:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B500E6F2F8;
	Thu, 25 Jul 2024 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jsuB2HXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFA52E639
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937907; cv=none; b=AVSoKM7cBgojfxn6nFBhmyd0Ns9MNZog2QUM0sr+/GZzasppSVLcCreNR6l6HNewrvLLijhza6KIvqUR2tbJSuSOVL0/mXUqGM7KfS7wC+PDek4vrq1bFCCv7hEQdtJbZBg6K0SoYsoM6bH8KvZnyye3OXJhIPuaj2/Egx3o6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937907; c=relaxed/simple;
	bh=JaYzqBMyPF80jMTtCDTc1TwKrAdK04fSVIXOYRtltrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWHbxwf4VW633h2UHSBL+sFMsf72pvMfm7+e9F/n5UfTZEvy9xKIEfda69T2/a+PpnCuvtGW0Air6F0My7DmS2QkGSB5dfsDnV3sabHWd0hWK+odupC3k1sx4CTJ8w4kosQCaRbEhtJKvzC7LyxeEKSAHjliwHN3ImDpzYDBJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=jsuB2HXQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-369f68f63b1so771563f8f.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 13:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1721937904; x=1722542704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnfU/RWRTkTpsac9tS8MQu9+biNvJM/HQlxJQ6JR/CQ=;
        b=jsuB2HXQ3lHt/0O8oYsrwfVhUJndtDpqftkGJ0tLZy5XdALN98P7o3H//lLZ6EbZzN
         EaWlz78EVl4USrDy9ys/X2ZzwBx99b2Gh6/rQBs1/rVUWtvvzf+6imzjxODayysC3F3l
         nzdKnVm4FdS0RPyOTkwk9JrVCnWYx4FAf/PcYYNkIb0mViGQQcvCpmgJHat4ZekXLQms
         W2CiwPy2p1lvgt50pYhnntg2gaimZd2g09kqbBxQv3S+LbydJQxXmamcoHfzQFOSKtfZ
         UlgSEWaCCH7m5ohlMqOVO6o/1jq9n1ikRKM5j+sjiB5JrJLdhHqPyuxMV5QK9QwSVmB3
         +3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721937904; x=1722542704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UnfU/RWRTkTpsac9tS8MQu9+biNvJM/HQlxJQ6JR/CQ=;
        b=fKkyN8E8tdpJRGw7Gwd4bx9iS0OGAon1akuecenNyR0gmoL/+aH9jS6pzSQvYsWFlY
         Ybnm6T+RhtVT93g/YAu+IfIDiziL+7CtfCq0FFaP9T+FZjWicOBrAZehdUpdMalg5qTI
         r8vuimA/cClTUE10OPK2rFLOP9ENRRbFJCLuCdCZFEGit9q638Lci1Yj2XGiRVuHzSTM
         c1wgVEqPi+Wyzi8ZlGoWYYmtdb9NhxAf4h12YgKTu3I+pCETYzsrYFgFaxdtXLKhhJMw
         ThyxNnkCp9bSYWwIT0HqRUDONgI9b4cx6dbdV0QgingeuDPvifvozXRwqxZt+EgwklrF
         KzyA==
X-Gm-Message-State: AOJu0YxNLzPOjRNo1Es0Xjx6uWYLPLZ5JlgLA790AgWEVt5P+V9JW/xe
	JnwwGFDDSqFD6shg5olspUvAYfHgY45wuRCDp7vl5yzKQMG1ssh+
X-Google-Smtp-Source: AGHT+IFK+bThaia/e1N6vgjD33ZdiDq8bl3ade//0JShFdh9haZfeeYW21D1RdJrp5Ii8nc1C9YXsg==
X-Received: by 2002:adf:ffc5:0:b0:368:7fc6:ee80 with SMTP id ffacd0b85a97d-36b36407041mr2196601f8f.42.1721937903756;
        Thu, 25 Jul 2024 13:05:03 -0700 (PDT)
Received: from [192.168.0.155] ([91.67.17.104])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb76f3sm1106148a12.72.2024.07.25.13.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 13:04:25 -0700 (PDT)
Message-ID: <6dda4a2b-e700-4639-8607-cf6d09c4427e@googlemail.com>
Date: Thu, 25 Jul 2024 22:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can you make a new v4l-utils release?
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <13a4e596-1854-44b0-842a-8f19f17fce15@xs4all.nl>
 <7de82157-adc9-4402-9e60-92aae885a776@googlemail.com>
 <d99db58e-876d-418d-b676-9b31637c254f@xs4all.nl>
 <2f710c72-a5dc-4d30-aeb2-9f9d3e921d49@xs4all.nl>
 <8c7f5c02-a725-4831-9ad8-d476f02bc529@xs4all.nl>
 <1f64c683-5990-4847-9503-c31adf2e58cc@xs4all.nl>
From: Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <1f64c683-5990-4847-9503-c31adf2e58cc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 23.07.24 15:45, Hans Verkuil wrote:
> I now have a fix for Qt6 pushed (even though it is not perfect).
> 
> So please port the following three commits to the 1.28 branch:
> 
> f09b2c091d90 ("qvidcap: fix core dump")
> e268a7229866 ("qv4l2: fix crash when disabling openGL")
> 69b3a7618cb5 ("qv4l2: always set m_haveFramebufferSRGB to false")
> 
> With those committed you can make a new release that should work with
> Qt6.

Thank you for the quick fixes. I cherry-picked those and released 
1.28.1. Once the Debian package has migrated to testing I'll try to 
switch to Qt 6.

Thanks,
Gregor

