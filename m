Return-Path: <linux-media+bounces-4865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFB84EE1C
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 00:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C95B2841A0
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5314F51008;
	Thu,  8 Feb 2024 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="F7Bwqhy4"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0B4F89C
	for <linux-media@vger.kernel.org>; Thu,  8 Feb 2024 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707436624; cv=none; b=qNLvx/jkuNvyEq24zMbphhVTTXOSJXop7dVWpiMs2023rWNqq/PuX8V4VOIuekqexYsQmjnUfoMis2PYqDCWnLE/7zhBhZfVBHyi6J+bh3zqttuG0XIRKnTlYUqLGm3Vk3g8hhDx1WYoNV0+9l+KJ6eUl7TKpYRW5j9wSiu7kao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707436624; c=relaxed/simple;
	bh=H96lt6AOsIZvQzTjfh3aZtBCC/gUm9b1THYv3gpiEIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5pipL0ontQSsikd5ISsqNEsebXaS7D9LANewEKbMY+WnseCf9bNhLGckphbypXzDc8ZxfSer6djruqFGCB5kx93MpVIxgPThgpst2CdfJYzzj0n4IoGKnop3gL8H7jS6AVfKpsig/kEVk5ythuMdAVc8KgZZjUJOLf5Lstu8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=F7Bwqhy4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1707436611; x=1708041411; i=herdler@nurfuerspam.de;
	bh=H96lt6AOsIZvQzTjfh3aZtBCC/gUm9b1THYv3gpiEIA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=F7Bwqhy4nYqUwlt87ZfB8EYoQarH21Arpb8GtLq0ol2h1UNnXgFNOvet7HociklL
	 mjfU6meu3iOqn9xv/xv3KjaH2Ph2NJk0R6IqyrUyCC9/EJutYFyGhapD5R/N5hnLk
	 bEDgKLgO5b7pG6Oqp0fijtm1PzjrDMrJPCFXFqrKlkp9wiTwWSJthGil6dAbsO4WS
	 C3K9W0Z81yf3GjQ30+KyELEFRIR+HnbJEmttj1jYuh9p/lIwUf1g3VeBcvxCgKvi8
	 4Em9Fvm2LueAJKmnW45+XM1a2VBk4ctTRxolqXETfhEmgBkTSF2QCSqxsXMP2nZEQ
	 qaJliS/ydL372k0MHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.186.203]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Ra-1qwsIt3Dmy-016Pu5; Fri, 09
 Feb 2024 00:56:51 +0100
Message-ID: <4686fb0d-3b7c-42a5-90b6-716da29e5ef4@nurfuerspam.de>
Date: Fri, 9 Feb 2024 00:56:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: docs: uAPI: dvb/decoder: completing the
 documentation
Content-Language: de-DE
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, smoch@web.de,
 tmn505@gmail.com, vinschen@redhat.com
References: <20230327192826.65ae299d@sal.lan>
 <20240128233249.32794-1-herdler@nurfuerspam.de>
 <20240207061020.0a6fa3bb@coco.lan>
From: Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <20240207061020.0a6fa3bb@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KBuwWcv13smkvesB2Wlbdzi0+a+cGqkT8Bffog/VDqllvnpVvCb
 775sKmkchsOS9ZXvBNVRkhhg5wdKoDjEX/M4OucTgyuIOjpsdlQvHmkyLeqagQ5mmb22oPx
 TXhnEB2NHBVY3zmSmNp7gX+lPL/f+ycPGW8nfH5+cPeQgGHPYSTjhiLq0zi60ojRFhjC7mY
 O2ER32XgFBEALdUclYsQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rj1olpxUgno=;ma0oVOf/KD31O/iAyJSXHU6XyaW
 PaTeSswfsyhfGtv+bo9AaoHEBC0xhv9yi4LzCRf27edML010FN2oRiXY9YKhL5HZatTeXK6Xk
 y7f8ewm7qhuPYFtXFRE3yLAnY4zYSG8QHf4r+ao0C/ydSeUFK8i833hfkgTelamwITbftDe3B
 YlcL7j2oIV73bKlyHgffsPBpdhmfSDHWlsvqwqgJbZA9qsOAZqVnkUIJWN4JY6vsbCN7hu3tq
 BD6t8DDq+CkiyRZoaQN2+EwSwsyh9Xu73vxjTAJtOxa8h7pcTyi8rKZNBkUfoSjmHvxj4uOsu
 fM4GgntZL5JGoIxQ2c9TJoV7///AUPwIjLvBEf8LtT9hTpkQUpIFuU6lpz/6YuFSxWDB7mySI
 B243lA1lK7GskovJ4sU/0lBC3WRX0f9Dhj/yTmEsSnvMLAPCMZVK0A6gdl3MymtMf0ENuw64f
 tjmDgXuHSiY+tkjEdiY6k+unNMkDArPu37eu/tfRpDskKw1OWU7Cp8cutDaZw/x0wQUlzJOG1
 P5cVOTHEIyoYE401y2Q/TpRzpQmE3lUqmb9GYm2FNyrLcRw3NqjIPCybYQVAVO3BxEIX4cLza
 Q/pRedL9mv/1EcVE2dzdZ3Kp8uRi5QBKuvQ20YpNgknkWL/q9QlMVYlTruqIxkkhhYXBiBeJL
 +msD94smNNfQfFaGGFCkrvsu4KALebKw4Zges+EO66qDNR4fWbNN19UtTIVV/9osb1W5kWguN
 JlFEcTc2dlegCbi4oYysWkLJkIjvLvnJme1XoBDrK5cs4o4umQwSmSpSXZMNrucI+gvlWNfZQ
 qMMX/msCRpoAyUAeOUVn4Q8Y6bqjWbtULhTQc3aMRnfIw=


Hi Mauro,

On 07/02/24 06:10 Mauro Carvalho Chehab wrote:
> Hi Stefan,
>
> Em Mon, 29 Jan 2024 00:32:43 +0100
> Stefan Herdler <herdler@nurfuerspam.de> escreveu:
>
>> This is basically a resend of v3 after 6 month, with some minor updates=
.
>> Changes since v3:
>> * Adjust title and description to better match existing documentation.
>> * Fix warnings from kernel test robot.
>>   (At least I hope it is fixed now, I couldn't reproduce this warning.)
>>
>> No changes to the text it self.
>> The layout is still identical since v1, just split into multiple patche=
s.
>> My comments of v3 attached below, they refer to Mauros comments[3] to
>> v2 and still fully apply.
>
> Patch series applied. I opted to reorder the series placing patch 1 at t=
he
> end, as otherwise it would cause bisect issues, as the index would be
> trying to reference non-existing files.

To reorder makes perfectly sense to me.
Somehow I overlooked it all the time.
Thanks for fixing :-).

I'm glad, that it was the only thing I messed up, I expected much more.
This hole process is still a learning experience for me.
Thank you again, for your feedback, hints and patience.


Regards,
Stefan

>
> Thank you for the series!
>
> Regards,
> Mauro
>
>
>>
>> [3: https://patchwork.kernel.org/project/linux-media/patch/decd5d71-f06=
e-5873-5ebf-7028107f65ee@nurfuerspam.de/]
>>
>>
>> [PATCH v3] (July '23) -------------------------------------------------=
--
>>
>> Changes since v2:
>> * Split the patch into a patch series.
>> * Incorporate the changes requested.
>> * Style updates to better match the existing documentation.
>> * And a lot of small fixes.
>>
>>
>> Hi Mauro,
>>
>> it took a little longer then expected, but I didn't had much time in sp=
are
>> for this. I'm pretty much occupied by other things at the moment.
>> The winter season would be better for things like this, but I try to
>> finish it as quick as possible.
>>
>> I went through your mail point by point and I'm confident, that I was a=
ble
>> to sort out your questions now. At least I don't see anything that need=
 to
>> be improved anymore.
>> The work has been done in a lot of small blocks over a pretty long peri=
od
>> after my daily work, mostly late at night. Despite double checking
>> everything, I maybe still have missed something. I hope it is not too
>> much.
>>
>> For usage it has been checked against the known projects using the DVB
>> decoder APIs:
>> * The AV7110 kernel driver.
>> * The out of tree driver for the HD full featured cards.[1]
>> * The "Enigma2" sources from openatv team.[2]
>>   (The drivers of the boxes are binary only.)
>>
>> Possibly unused items have been listed in the comment of the patches.
>> Please take this lists with a pinch of salt. With the number of items
>> checked, it is pretty easy to miss an occurrence or have a false positi=
ve.
>> Although I've done my best, there is still the chance that I've missed =
an
>> use case.
>>
>> I tried to complete the documentation of this unused definition too.
>> Most information had been collect anyway and writing it down wasn't tha=
t
>> much of effort.
>>
>> Removing the definition and documentation later at once is always an
>> option.
>> I would prefer to do it this way, if something has to be removed.
>> It is easier to revert the change in case of a regression.
>> If necessary I can provide the patches too.
>>
>> Regards
>> Stefan
>>
>> [1: https://github.com/s-moch/linux-saa716x]
>> [2: https://github.com/openatv/enigma2/tree/master]
>>
>>
>>
>> Stefan Herdler (6):
>>   Add documentation for legacy DVB decoder API
>>   Add documentation for osd.h
>>   Add documentation for audio.h (data types)
>>   Add documentation for audio.h (function calls)
>>   Add documentation for video.h (data types)
>>   Add documentation for video.h (function calls)
>>
>>  .../media/dvb/legacy_dvb_apis.rst             |    1 +
>>  .../media/dvb/legacy_dvb_audio.rst            | 1642 +++++++++++
>>  .../media/dvb/legacy_dvb_decoder_api.rst      |   61 +
>>  .../media/dvb/legacy_dvb_osd.rst              |  883 ++++++
>>  .../media/dvb/legacy_dvb_video.rst            | 2430 +++++++++++++++++
>>  5 files changed, 5017 insertions(+)
>>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_au=
dio.rst
>>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_de=
coder_api.rst
>>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_os=
d.rst
>>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_vi=
deo.rst
>>
>> --
>> 2.34.0
>>
>>
>
>
>
> Thanks,
> Mauro

