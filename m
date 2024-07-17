Return-Path: <linux-media+bounces-15075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A2933B51
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 12:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93BC8B21F50
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 10:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD017F388;
	Wed, 17 Jul 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T16oisUv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9617E8FE
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721212987; cv=none; b=P3HIlhNXvpwoepbmRc4y6EAR9Hb1MR5nEtvIzTBNqYSeoz+6sxX4n3QvgYNW+veLPFU6qsLz+TRB97QuE6n0pYQotdnd50phK9hiYumWlmVcPzJCy6eX6DjK6kkizJRCHBNsJTd+Vu2pL5jreZMfjZYv8roAm8zEslcsCMkhZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721212987; c=relaxed/simple;
	bh=jDYIVpkI2wrskYjogiULwXKO7ktZv1aJ7DZ3Nb1BvBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6JHWrdkH5iBEQne2Oe5WllXIkHafwOyJ3OqeYq2tmFVWcEjCAepKxmJLEPvaLB8V/0Ju57iLEtY4v4LHDm/mxBSVViwIIOiskv+GNZKoDRFYIOoL88Q2cZB2LNJ0FL4vz7GCvBAyjEU0iSsUAQBi9PyjT1p3glUI1IIRuxFPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T16oisUv; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-595850e7e11so7976914a12.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721212984; x=1721817784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDYIVpkI2wrskYjogiULwXKO7ktZv1aJ7DZ3Nb1BvBc=;
        b=T16oisUvxmtCSzkNI7xBOX0/YgRwBRxzjro5YbOIduudpSw7joiQQK5ve4r9rm+H+k
         rNCFDnhBwBnS9YRhh4Hlnc0uvvzlHh+mJwSNohs1hnooYWoTk7+5oGgDqLCYI1zZVAVU
         FzNR7UT6FCU1b9ArL2gIaj1vuYhL5P+cniBnpJ7FlXzu36h/O7A98a2spIpUR7D6CrGW
         hb4AC7l7WaiEa5ZKesmmoagqBVXNMe6TznlOhPIqowiH93uKfzK4IVH4uNYaYQMNrVbi
         JXJk3sfvZRrBPJeJvEtHDZ75MtB0+mf4InRhtXZKY+JR855ZByzbgknqhS2CjqW//gJv
         meqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721212984; x=1721817784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDYIVpkI2wrskYjogiULwXKO7ktZv1aJ7DZ3Nb1BvBc=;
        b=nDCkOCgtVY6y16Pxazk1CrChdL/lNomXK4BVbAWxVSN8VmNcNlj8hN818nUnEv2CvC
         LNvUR9L8DeigiBlwfp0i3z/gfPOhsOL4FXvr0guMeRXjhI+iaOekGCPoSiMZ9V7fJb3G
         jukcR+rafLZKdEY+SrsyHXnm/04fhNLKSy2Xbx1iWh5fZDTijGpKgMS8gPC+rnhuWd51
         iZ3Qa5CdjAZEdlmU6tPhU07Vg0GHUlDPDPQ749HfvXOU1j0tx5yoT5vX3Fw8wrGO8tNF
         mFrH9GAPZ25mNZMArT3JWjHiFGf5Ah45Q5DrtFC2UKfcOYbLEzToAS5wsB0U8R8rQT5y
         LKjA==
X-Forwarded-Encrypted: i=1; AJvYcCXybThxDFfVqvNuE1EF6B6BGjL3Uh3xsSdiz1XslUyIqsNQgOFDUkIFxQ5bT6GQhGRieEOZRJnEPg5mnVnhT97bdThTfhYXtGUOC4g=
X-Gm-Message-State: AOJu0YyZhJsB0QdNunghkhVKtpM0EGuABNN1b8BrYYJglGyDkFnxEd+U
	6BsVIgAlRdM6WHb7yY7ZlYRGLe+5Hcl6gsxtDYTDzxfL9ljPPbtWQCVpFQooLqU=
X-Google-Smtp-Source: AGHT+IFACSw0wcYk59/gj6GZBVlzplPmhNUj87R9Hfdq8QZPBr1o+WVmHKWfiYT/gpdP86UdBlCbXQ==
X-Received: by 2002:a17:906:2b4a:b0:a75:25ff:550d with SMTP id a640c23a62f3a-a7a011557b2mr86405166b.26.1721212984397;
        Wed, 17 Jul 2024 03:43:04 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f27cesm429797366b.124.2024.07.17.03.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 03:43:03 -0700 (PDT)
Message-ID: <2d8ac288-da60-490a-a6ac-ebe524e3fc21@linaro.org>
Date: Wed, 17 Jul 2024 11:43:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
To: Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Milen Mitkov <quic_mmitkov@quicinc.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
References: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
 <20240716-linux-next-24-07-13-camss-fixes-v2-1-e60c9f6742f2@linaro.org>
 <ZpeJmWTfZGUXsc7K@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZpeJmWTfZGUXsc7K@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 10:06, Johan Hovold wrote:
>> The use of use_count like this is a bit hacky and right now breaks regular
>> usage of CAMSS for a single stream case. As an example the "qcam"
>> application in libcamera will fail with an -EBUSY result on stream stop and
>> cannot then subsequently be restarted.
> No, stopping qcam results in the splat below, and then it cannot be
> started again and any attempts to do so fails with -EBUSY.

I thought that's what I said.

Let me reword the commit log with your sentence included directly :)

---
bod

