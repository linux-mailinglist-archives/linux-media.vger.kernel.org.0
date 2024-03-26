Return-Path: <linux-media+bounces-7817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13E88BBA1
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 08:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2051F38FF7
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 07:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0D132C1A;
	Tue, 26 Mar 2024 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TrgZN1iz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409DB1804F
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439261; cv=none; b=gbJJaxEld3MoFTs9kXNUFHjZR5W7BOsqOUlvQconotnPX7YHxFELQhs7m9oGx5edvDHhRQ7G3mgurldmo6t+eoVXVts7nCLdDNlkIIGcP6/ZnE+1wTxq9Gq6GIjmNJsXbAYwDQ0ygHl47ykN0BhO6Qpoxk8VoxMiy/KQdoQNvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439261; c=relaxed/simple;
	bh=jRKrW7gIfooZmJQAM1k+SkR+AHaPaDOhsPpbqUrFEXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPyJkAFec+ATPodTOXm971+0ab5Gj3vv1auLWKcv6i1TqZgngFINdBYoJNMRTuDh4Enr7wz+X44+B/ElWVrsS7DZAd7BfTX11QQMWAN6lbKzKmgdoh6uWtnHUJue0+kuZ7PZaxQtwcnerY+lRzGiK+H5qtfCKjeFc//r7SPERT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TrgZN1iz; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-47605f03b15so1308985137.0
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711439258; x=1712044058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoYfD001kdpXjiLqs9NHakNGRTiNLPtr7VRvnmAbU/c=;
        b=TrgZN1izB9Y0IHWR2PZT/AKnfgm432qENFOw38K1hF+4rj0x8fp1Xz+LJBCfmqV+0e
         /SiCBhKBoNzbBT5T1u7XwOi488gB1A90DXjsF2jEWod8WqhVqvtRpvxjHK7eSYlaVDLX
         JDpPtRhXmvOc0nRoUMxOA/3TD6j+8WhTJXceU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439258; x=1712044058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoYfD001kdpXjiLqs9NHakNGRTiNLPtr7VRvnmAbU/c=;
        b=xHKOPuoHCRT6+9k6cexxt0O4jdkK2Yh4bJqX8NWM4SFQmV142TukD9ZrNLxIg/d6Q1
         tzQ0HqF09A1k1W9fwCELIJpGl0EWfyFVTB5JSk36rmT0uhHvNwCWbkN+RObWMlokdsJq
         keqEi0mS4P1wsMUTg6HpFyZWxAs9dcFW+OysppaLfl+PJS/j6wVzNb+mf0GcNS9FVl1O
         fq9bq3F4SVjF8jkcXFasT0mik3JjGesv7qSFwKpwabUlJ+EaTsEXAkCnkOKAuD7PAJQe
         eAWrbJsLerW2WXtwT335hywf+ruOCoHvSzvnRaC98HCwNRnzGZqymFURl8JWu5U1wNhl
         ntCg==
X-Forwarded-Encrypted: i=1; AJvYcCWrBqWoxFA4Ip51NugVpxVTuqrXPSYPXCdpA11HEsW/9ywi3iqDNvsy6TCKFPV+1bg/LJ3NdOVBMEnUqSVi/1mmLgxseOr573w0Ipg=
X-Gm-Message-State: AOJu0Yw7Zz2OLyBsFuQNsjBZdy1rxqfqQT7tycX9JvYUdGEbqQS+cx9y
	/9MkQC5oTVUWDb+Ks+w+pR3lcN1RYrxOY48Tk+w0jGxqyBPcwuDXB1JyxRdiiqSONEaKaWW7qjK
	pMQ==
X-Google-Smtp-Source: AGHT+IHZVAW3lPuv/AXIEwTLthSwimTIjpAvgrPCGlg2LiHNMCMoJmtwM0su9y5PBpFYbb1u08OA9A==
X-Received: by 2002:a05:6102:3122:b0:476:bec9:fd42 with SMTP id f2-20020a056102312200b00476bec9fd42mr7092193vsh.28.1711439258501;
        Tue, 26 Mar 2024 00:47:38 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id r1-20020ab03241000000b007e08333a74fsm1141581uan.17.2024.03.26.00.47.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:47:37 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4d8881c4668so691406e0c.2
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 00:47:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdO1jYpQsM56PfFVeP23f8S60OATwnf0yAxkJr80FvqSBfiP0VKJD1vlcsN87DIrGtpodZ9KkhxGMQOhB3pbLLZ0veLWmZuVpZu0Q=
X-Received: by 2002:a05:6122:251e:b0:4d8:787c:4a6c with SMTP id
 cl30-20020a056122251e00b004d8787c4a6cmr7419250vkb.5.1711439257115; Tue, 26
 Mar 2024 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-obsbot-quirk-fix-relative-ptz-speed-v1-1-0eb1387d98c7@securitylive.com>
 <6e6b75a15cdc6a1239edc4d49b927b187ed20054.camel@irl.hu> <CAMB8T1ULcfBOB5VwZzUtvRnp4FvtBCFWxxTdb+OJK8FOpjKCXA@mail.gmail.com>
 <ec0430f6e687fc5e1a19338e381804b9d6aeabba.camel@irl.hu> <CAMB8T1Vv7CMqhH1ZY6fouxsE6r+6JbmeLnuFma_0_de814UoMA@mail.gmail.com>
 <CAMB8T1VWGaWtE0k5en4-xhE69G=OyFnhqJ3mexcgNSuvO_7uUQ@mail.gmail.com>
In-Reply-To: <CAMB8T1VWGaWtE0k5en4-xhE69G=OyFnhqJ3mexcgNSuvO_7uUQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Mar 2024 08:47:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCvGfA=B5YCQhSMRW-0cTQNWKGytQF74z9F_x-77WFPHpw@mail.gmail.com>
Message-ID: <CANiDSCvGfA=B5YCQhSMRW-0cTQNWKGytQF74z9F_x-77WFPHpw@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: Remo OBSBOT quirk fix for incorrect relative
 min pan/tilt/zoom speeds
To: John Bauer <john@oxt.co>
Cc: Gergo Koteles <soyer@irl.hu>, johnebgood@securitylive.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linh.tp.vu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon, Hi Gergo

On Tue, 26 Mar 2024 at 07:23, John Bauer <john@oxt.co> wrote:
>
> After looking through the current implementation all of the proper checks=
 are done in the getter and setter for the pan/tilt/zoom controls so the on=
ly change needed is the 2 locations to get/check/set the minimum when neede=
d. Thankfully all the code that does the hard work is already implemented. =
I'll be submitting another patch that summarizes our findings.


My issue with the spec is that it is not clear about what GET_MIN
should return.  Is it the minimum absolute value for that control, or
the minimum value in that direction?

In other words, can we have a device with a range (-10,20) (-A,B), or
only (-20,20) (-A,A) is allowed.

If there is no device that supports (-A,B), then we do not need a quirk.

Regards!


>
> Thanks,
> John
>
>
>
> On Mon, Mar 25, 2024 at 10:42=E2=80=AFPM John Bauer <john@oxt.co> wrote:
>>
>> Ok, I get you now Gergo, I think I got lucky and I think you're right! D=
igging into the UVC 1.5 spec I can see why this works, the first byte in ea=
ch 2 byte pair signifying the direction is just getting the signed bit set =
when a negative value is applied to both bytes so there should probably be =
some checks.
>>
>> Here from the UVC 1.5 spec:  CT_PANTILT_RELATIVE_CONTROL
>> +--------+---------------+------+---------------+-----------------------=
-------------------------+
>> | Offset |     Field     | Size |     Value     |                  Descr=
iption                   |
>> +--------+---------------+------+---------------+-----------------------=
-------------------------+
>> |      0 | bPanRelative  |    1 | Signed Number | 0: Stop, 1: clockwise,=
 0xFF: counter-clockwise |
>> |      1 | bPanSpeed     |    1 | Number        | Speed of the Pan movem=
ent                      |
>> |      2 | bTiltRelative |    1 | Signed Number | 0: Stop, 1: tilt up, 0=
xFF: tilt down           |
>> |      3 | bTiltSpeed    |    1 | Number        | Speed for the Tilt mov=
ement                    |
>> +--------+---------------+------+---------------+-----------------------=
-------------------------+
>>
>> I think it is the direction of the original implementation which is way =
easier to use than having 2 controls anyway, I would say it's preferred, it=
's how I have all my analog stick controls mappings.
>>
>> While the OBSBOT firmware implementation may handle any signed negative =
value in the direction byte we should probably check and make sure it confo=
rms to spec with 0xFF for counter clockwise and down.
>>
>> In the current implementation both pan and tilt each use 2 bytes:
>>
>> {
>> .id =3D V4L2_CID_PAN_SPEED,
>> .entity =3D UVC_GUID_UVC_CAMERA,
>> .selector =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
>> .size =3D 16,
>> .offset =3D 0,
>> .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
>> .data_type =3D UVC_CTRL_DATA_TYPE_SIGNED,
>> .get =3D uvc_ctrl_get_rel_speed,
>> .set =3D uvc_ctrl_set_rel_speed,
>> },
>> {
>> .id =3D V4L2_CID_TILT_SPEED,
>> .entity =3D UVC_GUID_UVC_CAMERA,
>> .selector =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
>> .size =3D 16,
>> .offset =3D 16,
>> .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
>> .data_type =3D UVC_CTRL_DATA_TYPE_SIGNED,
>> .get =3D uvc_ctrl_get_rel_speed,
>> .set =3D uvc_ctrl_set_rel_speed,
>> },
>>
>> Going to do some testing and report back.
>>
>> Thanks,
>> John
>>
>>
>>
>> On Mon, Mar 25, 2024 at 9:23=E2=80=AFPM Gergo Koteles <soyer@irl.hu> wro=
te:
>>>
>>> Hi John,
>>>
>>> On Mon, 2024-03-25 at 20:51 -0500, John Bauer wrote:
>>>
>>> I understand this patch might not be the ideal or proper solution; but =
it works. I don't think the UVC
>>> implementation can be trusted on these cameras, just like the Windows D=
irectShow implementation is off.
>>> I put this patch out there as I have encountered many Linux users who a=
re struggling to get proper
>>> control of these awesome cameras. If the patch dies here for now, that'=
s OK, at least there's a possible
>>> patch for those in need.
>>>
>>>
>>> Sorry, maybe I didn't phrase it well. Based on the UVC specs, I think y=
our patch is good for all UVC PTZ cameras, so you don't need to use UVC_QUI=
RK_OBSBOT_MIN_SETTINGS quirk entry, just apply the quirk changes to all cam=
eras.
>>>
>>> Thanks for doing this!
>>>
>>> Regards,
>>> Gergo
>>>


--
Ricardo Ribalda

