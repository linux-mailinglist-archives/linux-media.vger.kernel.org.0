Return-Path: <linux-media+bounces-12772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F99011C3
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 15:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 601B81C212BD
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 13:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D86179958;
	Sat,  8 Jun 2024 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="YEtQyrMY"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41AB149DED
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717854977; cv=none; b=sE6aaPNS6bibsAPNXgPaNfL5KsSoDgbf3odHupgcmtZIEfp2XNR5DiAZLTHl2l4UJaFFnWbm7uxgve1w8D/WyFL8sirmp6ByClcsumfodhfU0n3ZhltiEQzYVwAT/jZmRtYxcH6A95q2IDrtVaCELY+O2+/43BjFBCW+EU1Szjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717854977; c=relaxed/simple;
	bh=BFmmkJ1kCuW6NiwWZ+Ysq3taXRkdFNXbbRTu+OaKqJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKfmxE0Ow1hDAlynrFrGM8D4rnxgo/zxz9yk5kFmy3B7bVnXiedFx12FGPAe+d4cunYHKZFfiUBdBpJdwHGx5OKruObYqp7dA9BqDvW3GOioXflDD6jK7XHFKBEe1VAYU7l79P44DGzLubrnVeT9hGkiDMvZP55R6lsv66TCWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=YEtQyrMY; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0560960004;
	Sat,  8 Jun 2024 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1717854968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyYFGUl6v+RlXOuRgeCLpBJpE5dCWFay1tdHx22GMpk=;
	b=YEtQyrMYLox6lJF8OUhIy/c2Q4arnmF2sB3B4ghNtPKcgOgutBES7a7Iy0vS1TVG/0yZNh
	6h7S9pr/GEUHwtQgpd2PkORJ8v28h4BsMyY1qUT5829JqCMtgCIdmevz1+54TnubR+RLuO
	EbKCBjRjCXq+zzdya4gttvkX9ooG91Srw24GtPo6YQHc0/OhQDh5mr2zrT17TcY2k/tKa4
	48fzAIH908tU5vaTsDaOS5+Awgg/nxhhOj9ofU97iMMtXYjGdkDqgbKC6Pb5guFlSzfw0M
	JK7sx4LXHiGfmP8Vtwr/0dtMe1nn8CWmV4NsNJQiY2JKK2bTAFdcGpo3Pqwtiw==
Message-ID: <74d923bb-28b3-48f1-9da9-2311e6293ab4@yoseli.org>
Date: Sat, 8 Jun 2024 15:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: media: docs: build error of userspace-api.pdf as of
 v6.10-rc1
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-media@vger.kernel.org
References: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
 <456dfb99-83ce-45a3-be42-6b951713ff37@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <456dfb99-83ce-45a3-be42-6b951713ff37@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Akira,

On 30/05/2024 03:25, Akira Yokosawa wrote:
> Hi Jean-Michel,
> 
> Assuming <jeanmichel.hautbois@ideasonboard.com> is your past email
> account, forwarding a message bounced from
> "the mail system at host perceval.ideasonboard.com" as "Undelivered".
> 
> Also, I'd suggest you to add an entry in .mailmap.

Indeed, a patch just gone a few minutes ago;-)

<snip>
> 
> I tested "make pdfdocs" on v6.10-rc1, which ended up in a build error
> from xelatex:
> 
>      Package tabulary Warning: No suitable columns! on input line 48770.
>      
>      ! Extra alignment tab has been changed to \cr.
>      <recently read> \endtemplate
>                               
>      l.49179 \end{tabulary}
>                            
>      ?
> 
> I know this won't make any sense for most kernel developers.

You seem to know me very well :-) !

> 
> So, I did bisection for you.
> 
> First bad commit is:
> 
>      adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")
> 
> and reverting it resolves the error.
> 
> It looks to me like said commit added two columns in the flat-table
> of "Luma-Only Image Formats", without updating hints to latex:
> 
>      .. tabularcolumns::
> 
> above it.  This results in wrong column count in the output of
> Sphinx's latex builder.
> 
> Please update the hint for the additional two columns.
> 
> FYI, you can test build without building the whole tree by saying:
> 
>      make SPHINXDIRS=userspace-api pdfdocs
> 
> Otherwise, you will need to wait a long time.

Thanks a lot for this detailed report, as I reproduced the issue quickly 
and easily !

Now, I would like your advice. I update the tabularcolumns to add the 
two new columns, but it does not fit on the page anymore [1].

What would be the best way to solve this ?

[1]: https://cryptpad.fr/file/#/2/file/C8sTCY-cv9jj-mwgzkZgjEtr/
Thanks,
JM

> 
> You can ignore the extra warnings of "WARNING: undefined label:"
> and "WARNING: unknown document:" due to the limited scope of
> documentation.
> 
> Regards.
> Akira

