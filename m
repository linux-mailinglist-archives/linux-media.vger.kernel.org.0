Return-Path: <linux-media+bounces-20056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD39AB554
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6FF286382
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5BD1BE853;
	Tue, 22 Oct 2024 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdyfSH1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2C1BE858
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 17:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618906; cv=none; b=dKammVrIRCDG8w7FDnnsGvwvy3tDO/qw+cknqaoWPGZvSsuKtR4vR/TKYWsW/uJmIj+oSIhOheKna+9DUHV0586hqRYG7ljchGWkVbgYQX1sbQPz3aXxBQb/1LRYOwZA/d4AQMQ5fofYSAtDBLs9iOxvOeX76247o0EL37JBVhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618906; c=relaxed/simple;
	bh=4h5FbxO06YSXLKw5w2HZX+RAjAYaY+r6ovK222uafC8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=CwS2LgM33B8RaFUwXtYNYbMGWZWnDJBAPLEOcVmpS1P/l8gJZSYafo2jccA7uKPfjTpD3d+YZjX+1uwuK55VPUrNbgDSnephHy666ODz0jvLpdHabXdGB+JxMEMNhqY/Q07UZESo5spisOSI451q8EMLjLyCGrBqDmlZZkwaCB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdyfSH1t; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so7913433e87.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729618903; x=1730223703; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BWxaapEgSZUcz8iA0jFHRpvUJ8VMcN9JlKBoDeApRrM=;
        b=EdyfSH1t5d8PBwSpKuAvr3kSUplKRv9PJBSdVCuVeLoQIGV7H6djDmA7rix1IF7B5U
         xS4obGn6bvffRW3U6pAiv4+AfH9jkKjIA0DC559CmZFN/0/Otz0rFD7cDBQvfondqXYi
         NN/RvivWyBj1InjKieq4XRpeu0Jzy757qhMImMLXgM0qlVNT3e6zgeAS7VNbWmWDVa9X
         nXvYTAWKBI8J/dbuFZ4BUtvHnTnSvCPIavoi4FkHOvsNLRmxv38/tAg/Nfy4Eg8O8Eua
         QDNboEfSPxUJCekdCvIU4vrVygVzCBFfETS+FkXLEwPKdZAgPBMfNAJZ0iVr06OeuXc3
         gzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618903; x=1730223703;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWxaapEgSZUcz8iA0jFHRpvUJ8VMcN9JlKBoDeApRrM=;
        b=ArpPHhVf976L8uXVYfQhsNRajwg6IlVSVousk0Asn/65X+ajOL6jkpyhGbhHYRL13s
         9y/lkizIfmvgRC8v0jI8CODTcyZ9j1l+fkejPBrCEXaGJNTHFBOVnlNpDCaiD6b7COEA
         UfjeqjK8ix7u3aQYfVsxCtpwPSeK4qBehQIZFiHl99W8G55VAG6ILV55SOiE0lw5H7uR
         0i7wdZWxaPfL9FjDp9fF4ElOoDl+Ryyc9hElN+M/YPFNMvGWhN82xrgOUUtkqThbupXa
         q+GVu19TPKN+haXBHa00cdl8mrlvSjtBc6ilH2aABLB/gkgZuQkIXm90IgThxuoH/ppP
         vTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYPLCso2mMjkRzNHYGH2yjHPNkxCZU3kjVkPu98yJEDn1MMr7fsH7sVAseJpnHqhP0JzSSGlY6VnnQbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCkGVSdOOocVkkbDnchbrmCTQEifRoYg8rg+oHyTXeLP6RbBIH
	g/N4aAjrjDyk+MkIJftuCTxLol5CcB7YeMA1NXO57B983IHdz1mU
X-Google-Smtp-Source: AGHT+IF4t311d+gpj1bLGlJT1EEQpJH/pogHgFXEcoAbrZuokNWD5geK6sJvW8XfVtuDEzyhwaKaTw==
X-Received: by 2002:a05:6512:3da6:b0:539:fcf9:6332 with SMTP id 2adb3069b0e04-53a15494ea6mr8283986e87.33.1729618902499;
        Tue, 22 Oct 2024 10:41:42 -0700 (PDT)
Received: from razdolb (static.40.223.216.95.clients.your-server.de. [95.216.223.40])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243ed9bsm825424e87.255.2024.10.22.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:41:41 -0700 (PDT)
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <87ed497bcs.fsf@gmail.com>
 <mye7inyopwlumstqhycuyk2iuldlsp5axlndyjyxy3j4zqonym@rtfz7ap2e66s>
User-agent: mu4e 1.10.8; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Julien Massot
 <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 0/4] Sub-device configuration models
Date: Tue, 22 Oct 2024 20:40:46 +0300
In-reply-to: <mye7inyopwlumstqhycuyk2iuldlsp5axlndyjyxy3j4zqonym@rtfz7ap2e66s>
Message-ID: <87seso592k.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On 2024-10-22 at 18:05 +02, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi Mikhail
>
> On Mon, Oct 21, 2024 at 05:29:33PM +0300, Mikhail Rudenko wrote:
>>
>> Hi, Sakari!
>>
>> On 2024-10-11 at 10:55 +03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>>
>> > Hello everyone,
>> >
>> > I've been recently working (with others) on sub-device streams support as
>> > well as on internal pads. The two can be used to make sub-device
>> > configuration more versatile.
>> >
>> > At the same time, the added interfaces are much more useful if we require
>> > specific semantics of those interfaces, so that the user space knows
>> > exactly what e.g. a given selection target signifies. However, as the same
>> > selection rectangle could be used for a different purpose on a non-raw
>> > sensor device, we need a way to tell how should the user space determine
>> > how to use a given interface.
>> >
>> > I'm proposing to solve this problem by introducing sub-device
>> > configuration models, and by the common raw sensor model, also present in
>> > this patchset, in particular.
>> >
>> > This has been (and will, for some time, continue to be) the reason why I
>> > have reviewed few sensor driver related patches lately. As we're
>> > introducing a new interface, it's beneficial to be able to use that
>> > interface right from the start, rather than trying to later on offer
>> > compatibility support, which is almost always a fair amount of work with
>> > less than desirable results in the driver.
>> >
>> > With this solved, I believe we can enable the use of the streams UAPI.
>> >
>> > Comments are welcome.
>> >
>> > The compiled documentation can be found in
>> > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/meta-format/output/userspace-api/media/v4l/dev-subdev.html#sub-device-configuration-models>
>> > and the patches here
>> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>, i.e.
>> > they're on top of the metadata set.
>>
>> I've read the updated documentation you shared, and have a question
>> concerning binning configuration. IIUC binning should be configured via
>> set_selection(V4L2_SEL_TGT_COMPOSE). But I also see some existing
>
> set_selection(V4L2_SEL_TGT_COMPOSE) on the internal image pad, stream
> #0
>
>> drivers configure binning via set_fmt() (imx296) or both set_fmt() and
>> set_selection(V4L2_SEL_TGT_COMPOSE) (imx274). What will be the right way
>
> Existing drivers have adopted creative solutions to allow control of
> the binning factor but all of them are somewhat non-compliant with the
> specs (we went in great lenght in looking at these in the media summit
> 2 years ago). We didn't have internal pads at the time.
>
>> to add binning support to a driver I care about (ov4689), which
>> presently does not implement any binning configuration at all?
>
> Now that you can use internal pads, I would follow what is described
> in patch 3/4 of this series.

Will do so, thanks!

> Thanks
>   j
>
>>
>> --
>> Best regards,
>> Mikhail
>>


--
Best regards,
Mikhail

