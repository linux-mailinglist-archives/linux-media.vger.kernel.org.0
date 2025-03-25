Return-Path: <linux-media+bounces-28666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FAA6FAAB
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 13:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A70D16777B
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F1E204693;
	Tue, 25 Mar 2025 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKbiRdaW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D9F9E6
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904227; cv=none; b=fzex4/kNGQntWS5zzwH/dk66d+BuvmSJTYRYiaxKMYsUrm40AbJ1GaGyIM8DtanWjRAP5fddSTYA/Kbi1vmQje5siEpqAmAy67tJ11gh1B/CQOG7XwumJm0VVruZzot7Uc8P6Fm7XF1BAARSip6TEwpV2Poc6gXB2muvmSl7zXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904227; c=relaxed/simple;
	bh=RenHv1kcOWRn8WAgWQvfL2VJpBTr815gsHUKgOJNqp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piuINXB6OZMzyXJN88LQElprpn1Yb+sNTnNN/e/Fgnu/yvzH9CloARkaraBTbViLnPl/V04ekDzcEiePdQpGXzrhmP/Y99uIIp7RWkbYyR1tmGsq8B2yz0nS81PtDghRa1n3CDebPtZ9tGKeoFaqT28e3UwoDylupkI3O99Zppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKbiRdaW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742904224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3qSh3vuNv58pRLega9CY/LHW84nC+P6cdyORFDGM3I=;
	b=hKbiRdaWKOhslQXXzja1DrIENDb4ZlpSkf0lkXXvsRSul5vd6qnLp5Tif5CK9eU9Xro2ID
	Vea6uWMzkfXfLN5XiFxnBLGRsNlOTHmaiZzkOuKoRQnTY3sjnfJe0U5gK6yaazwf1PMqFV
	ZFm85SdvKYtkBTY55+ORMtuIE5kxfIw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-sHLQGTNtNyS-KqtdNKQPXQ-1; Tue, 25 Mar 2025 08:03:43 -0400
X-MC-Unique: sHLQGTNtNyS-KqtdNKQPXQ-1
X-Mimecast-MFC-AGG-ID: sHLQGTNtNyS-KqtdNKQPXQ_1742904222
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5da14484978so5577919a12.0
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 05:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904222; x=1743509022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3qSh3vuNv58pRLega9CY/LHW84nC+P6cdyORFDGM3I=;
        b=oOmQIafiLdCqDakGLWMTcMXEX+v6o0AvyMclUAh69YK1C1iJ1tmsCw+xVUu2j7Mouo
         Or1cvy+5fBpRN9n2ixmh7zB+s7/IOLtQ2cihMWGAKDG6UBlakhp/h6WEiUW038M2FACg
         dN2XhuMUg7Xz1myx5OMsgIi7MdFOo6AEm8gm1wwntTf6M+iiQYE5L1nkeIQEYMFLDHY1
         APrU6I5GasUZDIwiIzUTR1svWv5UpsvwImwupV8g+Gwboh8Zy+/BtU4cpMFutRia8ZHt
         iHk8kGaL4c+bqKlliZM4pGXQC8vKG/f2IBchbYr47o9ETFHklT0pSTKliei8k5qnHzFJ
         L6fA==
X-Gm-Message-State: AOJu0Yz7DgETURtG3sKxs4FzmmcAC0t/beJytIzJCqymd6j8YRQmuPmF
	sAMiFOaW/JVfEtobFDGl96J51X4wYhrVCIycydkyLQVGngfLMpquAAeDstEZhQX/vlsi93Mhuh1
	Y9tY3i30Kc3XxLeCCrvQxlzO8R4NhAvrXJ0SWisvIj7GfJZ2i/X5tLSxwODye
X-Gm-Gg: ASbGncvLCMoAoQrGH8DHHFwVUHSyJ2mbvcSC/EEw20b8oo3iwb13j/MkMYJBEO1lveb
	K/mGzr4Ut7yqnSelWJ8s3yJMp+0MwKoKCv745O9kccBnpa2a8DWNJP1WqhtoUzj7M/p9IPtHyRq
	jjS6NGA09p8Zj6Up1wxvFwYiHmKpgFhumUEHyKittr8DAi7kcwpoXiMYBUwIajjRricmxSBb+p2
	g4SKvQhpDo20AvzyIJRrKgcxZF5cYHB50HTuesC4WlqMINsPftyMKE9+ho3vp/vAWZQVdetA9Hz
	xQZxsfRCqvorWn2Dr7LLP78rivtDOhLJ+pm9Qavl8OlK1UMP/H2WcXaHA23WA9xzt4Fpi14JRB5
	4UIzgxCeHnEbdMMi4qXfJQqYJ+9K1tj61UeOGW4Gxej456qj6HR3H6VC3y+Jpr5wXDg==
X-Received: by 2002:a05:6402:500e:b0:5ec:92c3:58c5 with SMTP id 4fb4d7f45d1cf-5ec92c35a94mr8044818a12.29.1742904221648;
        Tue, 25 Mar 2025 05:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRwY31clX9FOPw9zXJ+PUmrz8crumIEr6kDC+TeoySLz9GrwVxHSJXlN/kht2RSoV8UJAexQ==
X-Received: by 2002:a05:6402:500e:b0:5ec:92c3:58c5 with SMTP id 4fb4d7f45d1cf-5ec92c35a94mr8044717a12.29.1742904220848;
        Tue, 25 Mar 2025 05:03:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf668d9sm7609531a12.10.2025.03.25.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:03:39 -0700 (PDT)
Message-ID: <329e52ca-774d-41b3-8ca1-71009176888c@redhat.com>
Date: Tue, 25 Mar 2025 13:03:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 25-Mar-25 11:27 AM, Laurent Pinchart wrote:
> Hello everybody,
> 
> Another year, another libcamera workshop. After the previous editions in
> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> ([1]) as part of their workshops day ([2]).
> 
> This year, our workshop will be colocated with the Pipewire workshop on
> the same day and at the same venue (but a different room), to facilitate
> discussions about topics that span libcamera and Pipewire. The Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 13th ([3]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

I will be in Nice and I would like to attend.

2 topics which I would like to see discussed:

1. software ISP status + future plans

2. using a single IPA with multiple pipelines.
Specifically atm my WIP atomisp pipeline-handler is re-using
the software-ISP sw stats + the software ISP "simple" IPA and
another candidate is using swstats + the simple IPA in the
uvc pipeline-handler to add autofocus to e.g. the logitech
quickcam 9000, which has a controllable focus but requires
the driver to do autofocus in software.

Note this is not really a big topic, so maybe we can find
some time before then to discuss this on the list.

Regards,

Hans




