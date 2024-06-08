Return-Path: <linux-media+bounces-12774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A090122F
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 17:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC9A282521
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 15:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9372415688F;
	Sat,  8 Jun 2024 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN2lEaWP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AE2561B
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717858966; cv=none; b=gdujGCFWUjUS3kdLriNd4/nOFQzAa9z/xeqIYRj9cB5PCtA2JrcIvEgSmNAUnnUCIceXUfYE3RWnQNT6JaTcoHtv+/w5AJogc3ogNuJUiYKg8SxVP090dBXhdMKM/cWu++Kg87Tq/WFRPHZnH1DrUcd8P9ZgCfFUaPyS6t1tKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717858966; c=relaxed/simple;
	bh=ksHjcMfgWFYj1Y4daDRYH+H2NXdsLnBpzH7Zez8a/ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6cPXtsWWF4ZI0ntjd5+xXuhEgtYO9vfLhPTpWXt2ymdNvFuPLB4qd1JtS1Dy2Qrirh+8tfH22PZYLVsKfgVnd380Qf8QClB84IDMeDxG+dCUPiHjpmIwouR9ahpN5yNO48AVk3XvD5ZyvM5qOUsqMErSBp4X3X+IpDgWl4CheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN2lEaWP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ff6fe215c6so2659817b3a.3
        for <linux-media@vger.kernel.org>; Sat, 08 Jun 2024 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717858964; x=1718463764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b50Kbu/e0srKYYtu860q1nHZjGwc5eggYw2/MD3bY+Q=;
        b=AN2lEaWPSIg9PFpwXAG3sHT71wydwGF6TM0qfx8Y/3OxHHvm7ikzE7sciDXRZIcgdx
         +L3vcxgZJRGpvB1f5teKYjGasn5ZEbuljEhxRTnCjONaKGdw0fAsef1mrbdzn7t1AJGL
         JwFbECaTFlWCT+bArEHHWf+NcQu30lvhjoh7MgcCong+7JFiuFXtGhsRQHbZj1or084y
         Quycj9wj9PvzY4WgqnUnguRe4kb1TiwCo6K6KKZ2o95qoAAlNbXavUmweMA/xDxlBT+7
         NLOobAY0CXBhD9+vxnh3NaO71kJcF1PWyl9guInNVpxmPX5cJLIvyiY+pFHWkqsOmE8T
         fFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717858964; x=1718463764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b50Kbu/e0srKYYtu860q1nHZjGwc5eggYw2/MD3bY+Q=;
        b=TxjHvdMsfJUQEnra0AglyZkZMHZ1GZS5arTU+FRjjFUVSpDEQ4aXHDp5gQH4VUHrdC
         ubT4pz2ZHZcponIu0rad97rqVehb/vsW5EjNPpuoixw9aTD+d+NOhLK3lfyDqWF4mcGO
         Eu83c3gusUEkWv/7d8D+POaoBTWB/hwovbtU7xjRL2BMW7FbiIwC5LsR5PY2Ae7DH9IC
         vIC8Ca1ML81+DJZWhRgfTxgb+477v0/66QdOsbRZky3f2bOHors1gYHvKgbzB93042FD
         1yAhLg4P75ru1Hr9YK2UDkuOpNfxxgzCi4wdsVlFP/M8GqHhhpzwaMajRmQv6XGU3jZP
         fcbQ==
X-Gm-Message-State: AOJu0YzRWxop5uTnwC/FUzB3beaZAACqbS0DUWWtS96vl3AUlkxJbA3z
	m+rLaSUx+b33DpJovyYmleUdRcIIWb5YR7fxt6rw5fWGOaRkwNB4h0vqHw==
X-Google-Smtp-Source: AGHT+IFsBrmM81kdP3zj36RNzoH2Yg4CWORxT17ZObHOGT4k4x3vARLTvmel367qSj5KPt9lhooqTA==
X-Received: by 2002:a05:6a20:a103:b0:1af:baf9:fef6 with SMTP id adf61e73a8af0-1b2f96d6b2dmr6024361637.16.1717858963488;
        Sat, 08 Jun 2024 08:02:43 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041bb50dd1sm1947739b3a.193.2024.06.08.08.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 08:02:43 -0700 (PDT)
Message-ID: <83ffb1d7-fe1d-4eba-893e-f685a1addcd0@gmail.com>
Date: Sun, 9 Jun 2024 00:02:40 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: media: docs: build error of userspace-api.pdf as of
 v6.10-rc1
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
 <456dfb99-83ce-45a3-be42-6b951713ff37@gmail.com>
 <74d923bb-28b3-48f1-9da9-2311e6293ab4@yoseli.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <74d923bb-28b3-48f1-9da9-2311e6293ab4@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, 8 Jun 2024 15:56:07 +0200, Jean-Michel Hautbois wrote:
> Hi Akira,
> 
> On 30/05/2024 03:25, Akira Yokosawa wrote:
>> Hi Jean-Michel,
>>
>> Assuming <jeanmichel.hautbois@ideasonboard.com> is your past email
>> account, forwarding a message bounced from
>> "the mail system at host perceval.ideasonboard.com" as "Undelivered".
>>
>> Also, I'd suggest you to add an entry in .mailmap.
> 
> Indeed, a patch just gone a few minutes ago;-)
> 
> <snip>
>>
>> I tested "make pdfdocs" on v6.10-rc1, which ended up in a build error
>> from xelatex:
>>
>>      Package tabulary Warning: No suitable columns! on input line 48770.
>>           ! Extra alignment tab has been changed to \cr.
>>      <recently read> \endtemplate
>>                                    l.49179 \end{tabulary}
>>                                 ?
>>
>> I know this won't make any sense for most kernel developers.
> 
> You seem to know me very well :-) !
> 
>>
>> So, I did bisection for you.
>>
>> First bad commit is:
>>
>>      adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")
>>
>> and reverting it resolves the error.
>>
>> It looks to me like said commit added two columns in the flat-table
>> of "Luma-Only Image Formats", without updating hints to latex:
>>
>>      .. tabularcolumns::
>>
>> above it.  This results in wrong column count in the output of
>> Sphinx's latex builder.
>>
>> Please update the hint for the additional two columns.
>>
>> FYI, you can test build without building the whole tree by saying:
>>
>>      make SPHINXDIRS=userspace-api pdfdocs
>>
>> Otherwise, you will need to wait a long time.
> 
> Thanks a lot for this detailed report, as I reproduced the issue quickly and easily !
> 
> Now, I would like your advice. I update the tabularcolumns to add the two new columns, but it does not fit on the page anymore [1].
> 
> What would be the best way to solve this ?
> 
> [1]: https://cryptpad.fr/file/#/2/file/C8sTCY-cv9jj-mwgzkZgjEtr/

Let me see.

It looks to me that you can reduce the width of 4th column (of "Byte 1")
to 1.3cm.

If that can not make the table fit in the page width, try reduce the
width of 2nd column (Of "Code").

Another option world be to reduce the font size by using \tiny instead
of \scriptsize in the

    .. raw:: latex

directive above the table and reduce widths of every column.

You may need to do a couple of tries and errors.

Good luck!

Akira

> Thanks,
> JM
> 
>>
>> You can ignore the extra warnings of "WARNING: undefined label:"
>> and "WARNING: unknown document:" due to the limited scope of
>> documentation.
>>
>> Regards.
>> Akira


