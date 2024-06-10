Return-Path: <linux-media+bounces-12807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09151901C20
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07DBF1C21BD9
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE763D57A;
	Mon, 10 Jun 2024 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Au2wHBkd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D782EAF9
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718006049; cv=none; b=d0KXbIo5Rc/BT05XXvl16WOjGhOiolgYPQbp5rfKzo3Qcu/5kTl/ffBIwP3mePEaKfONtpNfi8kBVRr2Tzm/0WlGcfH6d8k3PGPVSzh1pYbSU4oSIGHrtwiv+W5a94bHs+tojeKcAmlUQqiLLDchhpKv1y3TT1rZWieQki75gLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718006049; c=relaxed/simple;
	bh=zqamPiF739sol86TOJ8tkxxMTNunwcjcMwV8NwVkf+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/oDqHGy5JnKT5qQemSM/2oUcQerWq3jfKJDzKAO+h9n4Z1llx8AQr5wPfAVRIrRXkPP4pRdnv1zRKdbbiCLFx+e9Cu1fYeGhiJuGNOWDiOGoMggaEwpJ8NocMg4yifOwUcp2WyF0Rcb6hq7LZCW2DXJVtEerAR3iR+SPNTUetQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Au2wHBkd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c831b6085so340937a12.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718006046; x=1718610846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ynBzD6IDnomBAQa1qUjkFMCs1faPI4vdoJ0aRWuOqhM=;
        b=Au2wHBkdHsBVF7F9w5rMzcj4Lax6MbTXov5vqhEs6GDvGX1YvUK9VrZ2p+KG0rx82D
         ELRCW7aCoOZY5UU8x20XE/e0zezxw2TnbQ4fhJdcVLbMq/G9KDTv3Mxz7PSlI5eXvWt8
         X4KO9DHOZUY1n9gJvdggp1EWpmbVBGk3cB53BdVim3mbVx/hYhLCxtOrVrFcIjXQcZ3T
         O/wpQfkoDnzlB9mkNEKzkZs/S8Uzdw63x8QZ4/q59uhCldDkQ9N0kHdYF5wKqqcRrNG3
         AnYMxn8UX+5bXUF2Pg5x+xOv/jlMgd2IAjSc3M3kjGT4ezuZCn/csJVCepf91YzGA4MH
         o1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718006046; x=1718610846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynBzD6IDnomBAQa1qUjkFMCs1faPI4vdoJ0aRWuOqhM=;
        b=XF1Z+auKlfvhTLdxZhYr1wJP8FmEdSR+XSEWE2D7N3E3AbIY6bu9J3+fq6QS30mJ6A
         oPUHDS9h93sPu8Krnwwyb1BxkNO8oB14bpwJ+nKp/1uj10Ttm/uxaSkcpzx/Owv2OVEm
         O8UpCFpGLOj2/cNDbSlzEIqhH+mzA0c9xu0mF1/S+/YyJxiZzfs0j5w5MSQNrdO18i0X
         zXIsJ9MhpX3qLFrmuMOAKtDhgtdQWTA7KZHdzFSBJaGPSLKmd8jFu4oNR9pzum+iRQg6
         GfnUUZiDIIHI9qXD/wLDD2zUs/NLTNFRB8qlS5KRuz6lkf8Qbsaw/sdRjA+e1Wc5Y3xA
         daFw==
X-Forwarded-Encrypted: i=1; AJvYcCUCr1VQ46znKC63wgCninOSh6uAG3UQMsBSGhD9p3/+aYe15H/fYg3WQS1qm+lACnb2nK5EUY+nBrnocOaL8KsJ66bs9CEaPvCIsbI=
X-Gm-Message-State: AOJu0YzUwcNszMwXSMCXIBbA0aKpH2u01X3F9LznynxQPN4jchr7l/S0
	KIaZguovQ75/5/MoxlnM5ElRxxeQk/PtF4Ns9cMgwubl6LGRGZpidmycw1e2dQ4=
X-Google-Smtp-Source: AGHT+IHdRdyLJ6WsyrheYFHxIeRPB0oABICESCj9zuJtPpg8iBOyfbB7pnW2O0rRtS8oYHhFAWfpQA==
X-Received: by 2002:a50:f60b:0:b0:57c:5874:4f5c with SMTP id 4fb4d7f45d1cf-57c5874587emr6584352a12.32.1718006045617;
        Mon, 10 Jun 2024 00:54:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c71885170sm3350965a12.2.2024.06.10.00.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 00:54:05 -0700 (PDT)
Message-ID: <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
Date: Mon, 10 Jun 2024 09:54:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julien Stephan <jstephan@baylibre.com>, Louis Kuo
 <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240607144154.GD18479@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/06/2024 16:41, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Fri, Jun 07, 2024 at 10:52:33AM +0200, Julien Stephan wrote:
>> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski a écrit :
>>> On 10/01/2024 15:14, Julien Stephan wrote:

Eeeh? January?

...

>>>
>>>> +
>>>> +          seninf: seninf@15040000 {
>>>
>>> Node names should be generic. See also an explanation and list of
>>> examples (not exhaustive) in DT specification:
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> The seninf is (mostly) a set of MIPI CSI-2 receivers. Would you prefer
> 'csi', 'mipi-csi', 'csi-2' or any other name ?

csi@ works for me

> 
> There's also the camsv IP in the same series that needs a generic name.
> I really don't know what to propose for it. Could you recommend
> something that would make you happy ?

Sorry,that's almost half year old thread. Not present in my inbox.

> 
> On a side note, that document lacks appropriate generic names for lots
> of building blocks found in recent SoCs, it would be nice to get it
> updated. You will eventually get better quality DT patches then :-)


The list grew recently, so just add something there. But it is okay if
some name is not really generic, it's just recommendation.


Best regards,
Krzysztof


