Return-Path: <linux-media+bounces-5648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B739F85FAA7
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 15:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28A61C2087F
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 14:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43FC137C29;
	Thu, 22 Feb 2024 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbG+Ba+6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0713341F
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708610503; cv=none; b=CtJ5+rUIiVcOZZwus6/WwSzAdro/jY6UiEqysVtcGeQfiSLaQ+GTeLmWZfuzNHvwcNc8qiEc2gzC4RDWLKOn03ucawS2ExYS2r2dJ2ooBGu+/mY1P0sYT+BNRxw5OtbuY0d1UuI6jNm2vxFVddu8w16z87UKjmDZZBfOXd6EdlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708610503; c=relaxed/simple;
	bh=EmA2BkXIgDlEC//Y8u10vjcrlCkNMRPtNpNgzpbfr+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDpmGpjAyxVsCbqKjzA2i7fjoNV7NJyB7tqsNnZV+QAplxJj+5OFPafKfryLbhLjDt6hscf47A7lmwdBwyO8PGQfgCZ1C4jz88hioz8+PpZe8f8do8DIm/MpuVnLwe/BnElJUzX/1udUhtTS+qp8vueSYtfVpaxw84ZBpUccOp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbG+Ba+6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708610500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hljB189oDAY/r7Y2S/tdJH7IUT30QnNwu/am8dZ2R5c=;
	b=QbG+Ba+6FuzA5MJeyj8xceSW+Hl+Ew21ff/WzOzxxygzyNbdEATD1y0IucI+KlUu/Oohe3
	GRdFTzPMbfTQgfa/E9I1IXZlJBohHFpPskfzzkwrF6OvrkonhLz8k9tLwXau6ASTyajrNZ
	HIEqdb0xX62b2HNUbx1l127nkEx5Shg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-ynqAYklnNOCS7PWWREKwug-1; Thu, 22 Feb 2024 09:01:35 -0500
X-MC-Unique: ynqAYklnNOCS7PWWREKwug-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a30f9374db7so87008366b.0
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 06:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708610494; x=1709215294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hljB189oDAY/r7Y2S/tdJH7IUT30QnNwu/am8dZ2R5c=;
        b=rRqquDjCVBAYIAy/UfEU6bxGcWufRMSGk36Avvra9L3DQGBrFxmU73o1qnTBGGivvk
         Dgky/vOyJUYMY5+Ki/FAK8VVcr2D9pe/5wo1syQa1DkUkHCDaclqgCT5dU+t0AA4ql9n
         i45KLBQqdMnDifA9Szc0FnHzr1Wd707Cem9kSxu96pJAHzmptsgBXT2aH+NPQFvPm3P2
         WcTzABG5mG9B/7+2UqYqWFlBSag29lbFNR4SeJ4OT8NIMeXIc5Itpo13o36lVWvOZESj
         G2I4GTllARYRNzofPXWWkvE3KHfFYXcZfWsGxn1GGEjKIXZe5X0/CWAuWKJm3RcwpVmM
         SHYw==
X-Forwarded-Encrypted: i=1; AJvYcCVLkiSMQ9CsLWSYb7QbypLgjlEhttRu45Ly8vNwszBLvXOrCzDv4yk0aHHXlVcu8ZTrijPb4M0GpnuceJp9Ze/qu/nXp99AmvaDpQE=
X-Gm-Message-State: AOJu0YxfWcRLrXeSlbWqKr1tkXGRAcHzEHO/bDrw4sETLpf6T6KKPwOM
	N/LT/QEVTLhgb1f9+kbofZpg/EUAKeZk5QMeA9AprGfyFMC/asEysNNyQbboSFZtCTHceSPDQxt
	jYqk4Bvru6nEtGVZn61iLNP08j4VS39baZGyoDQRhLSrvCETRlrsDDFfbNtiN
X-Received: by 2002:a17:906:af16:b0:a3e:7d76:6559 with SMTP id lx22-20020a170906af1600b00a3e7d766559mr2509073ejb.33.1708610493813;
        Thu, 22 Feb 2024 06:01:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxdFKxZww6/GsNzC42i59R+OOLHidUuMWhcYHK65YF/58u40YcNZj2aIM6rKg+FUfHoR+cjA==
X-Received: by 2002:a17:906:af16:b0:a3e:7d76:6559 with SMTP id lx22-20020a170906af1600b00a3e7d766559mr2509047ejb.33.1708610493467;
        Thu, 22 Feb 2024 06:01:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lg9-20020a170906f88900b00a3e94142018sm4118756ejb.132.2024.02.22.06.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:01:33 -0800 (PST)
Message-ID: <02be0e27-9874-49dc-8367-1c53d72d667c@redhat.com>
Date: Thu, 22 Feb 2024 15:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.9-1 (#99236)
Content-Language: en-US, nl
To: Jenkins <jenkins@linuxtv.org>, mchehab@kernel.org,
 linux-media@vger.kernel.org
Cc: builder@linuxtv.org
References: <20240219154739.850030-1-jenkins@linuxtv.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240219154739.850030-1-jenkins@linuxtv.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 2/19/24 16:47, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7f7ea4d9-1862-4532-b19f-46c1bba36af8@redhat.com/
> Build log: https://builder.linuxtv.org/job/patchwork/380130/
> Build time: 00:29:35
> Link: https://lore.kernel.org/linux-media/7f7ea4d9-1862-4532-b19f-46c1bba36af8@redhat.com

<snip>

> patches/0005-media-atomisp-Remove-custom-VCM-handling.patch:
> 
>     allyesconfig: return code #512:
> 	../drivers/staging/media/atomisp/pci/atomisp_ioctl.c: In function ‘atomisp_queryctl’:
> 	../drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1401:30: error: unused variable ‘vdev’ [-Werror=unused-variable]

Mauro, The deletion of that variable accidentally ended up in
the next patch of the series. So after patch:

0006-media-atomisp-Remove-ISP-controls-which-get-passed-t.patch

This issue is gone. I assume this is ok?

If you would prefer me to do a forced push with a fixed series
with the removal in patch 5 let me know.

Regards,

Hans





