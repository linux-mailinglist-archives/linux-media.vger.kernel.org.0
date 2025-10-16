Return-Path: <linux-media+bounces-44689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D010DBE214B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7B404F11EC
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAD52FDC52;
	Thu, 16 Oct 2025 08:03:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B882B2641D8
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601785; cv=none; b=uMcSWJ5+tSOwNyYaf8rWPzAwQ7wrFQa63HM9CbiRYQ2hOb25rkmFijVoItZ9mH5LSyqK6tgGS7hMmfOU4y0My4im/wGPzyXYHfaa2rEHrhqFyt3CUBt/oN7gBJPXHuFb0e8KDrOHkidiQmJoHEQvRibYSleMoSWSFVIs2qpcB7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601785; c=relaxed/simple;
	bh=1eGQTAnWNGY3mGah0Neq02H/T5/f9gtIvSd+fn8FW2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJVzU1CFTKpTIVmlta/R+aS8zCtZD3xqjImCK7dN3HSMy6Nk08Y201ZRm2xpUQgMVUDoJyMeFqMD3NATaRc6FGGaVJPyTAfZ9hwlFNH+piAL0hYhUQ5+u+TGQLsno4tifjttgnVSfI5kWA0jvePLF0LrcKh7IQbrLmjSMD0QtDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-85e76e886a0so62329185a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601782; x=1761206582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd9DhXGFTz7VluvF3CXaOYryMfT47ujx56ubcyYXsIw=;
        b=uN4qQlzwvlsKZcQEZIxHGsETiDWr550qoiv6HpxkVP2c3k4gCsnst+jWmp+4PEwMD4
         kscoFPqUAjXr/BPS7mKDAkLfAAIcjpG86XlC35aAFqnaKj5C53cvOnBwU+ACee4vcYK4
         62fzar2vBkrfz7NVUkhun1FEuof8kIu4dEL2mvNSCDMsO8ZFfIx5F6xDf5TopDYGymQA
         OgthBwg4t1wWLEhxOcFm1G2l+lQAvsxBgor/F7OEvIT8JUds2gnDOEQZeyltV46p/UYX
         iPcZnsQjWuQ4CyOH3BA1fSeHnCFxEM4QgTd4mSo4UZkDldUqAJ6j4ofcxI/6QO/GkHy0
         9szw==
X-Forwarded-Encrypted: i=1; AJvYcCX21q0TrgWGtsE1h/2u20lgZBDwMRiJBXLca7KMqic0AExpHKGO6ZA5pla6Bj1xrH3KTEvzNYH4c4hB8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw77A5LNLPir0jBtiy482GRYP/IbZeh8OL/vdaCh/S0rAJsf6Fk
	fIoRBJAzIyybCgAWQ29NS3Jueik3aXZE/RQRndtUv1xoSQYrIOmeuLTBepaKY2hA
X-Gm-Gg: ASbGncv8elbiMdY4YTJ2I0IidEK6fgTxA5XHxT0NbUsgwVxevUQmCYst4EXXupeLjh4
	gRSSqZfY2UuEVW2+a2fNFbISjrpSEFZLRv2U52WM0rVp1naoDPiVOmcZ5oJ1TRGmnDr2FLWb9/Q
	9wxVXgcFRgo3pvCZ9zEFWts1bjW20Kplstx/aaEVcFzKFdIhwM0Rc2tJMnX7NjoX+1ReWCOAL2d
	uIuP9MrGDze2mgDiRZYA2CV300X1nTz3ltixwEZmaClLh+rE2Ot4n6TsaPF/JspWQErPaaEHK0t
	ISQBoVaYmAZ+d0ILbWYSV8gwrte5CeKYZG8pvjSRHm2IePwEEmHn5rB6gdA2Uwz+oEry0eFsc3s
	UbMJ07fjxCkZs+9xW38BwAzNJSvSOsuN4eVJ9B7xGdIVAtxNKZECOJ+NiUGJhYhY9m+6FGrbowb
	0wmh3MEMeXGpPrD0/ya5VbHmcMvRb/bXxymzcvsKL9ezIo2svB
X-Google-Smtp-Source: AGHT+IHFVZ2URcPq6T3Ey3oh1e3NtLa+x7J08WEUjjK5OUjqNsTF2ivGp+XwXAEs13gu1jFQACUtFA==
X-Received: by 2002:a05:622a:4ce:b0:4b9:d7c2:756a with SMTP id d75a77b69052e-4e6ead709e5mr446509531cf.77.1760601782515;
        Thu, 16 Oct 2025 01:03:02 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37e50ebasm146822985a.31.2025.10.16.01.03.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:03:02 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-78e4056623fso6720896d6.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ8slZE54/NaOctwm0sakd2AA9HygYFqS+8K1l/4dDEcP5tzn70uudWUa8uQOQop1ttlhF5pUmSDZHSA==@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-5d5e23afcd1mr10705349137.30.1760601430958; Thu, 16 Oct 2025
 00:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
X-Gm-Features: AS18NWDjBoTWi0arzS-uHQaIyzTZ8PYUb4ECqZaEUF0sSO-4JEe-m7M7qjhxsvY
Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Since you are mentioning mixed quotes, is one or the other preferred?
Shouldn't we try to be consistent across all files?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -129,7 +129,7 @@ additionalProperties:
>
>      - type: object
>        additionalProperties:
> -        $ref: "#/additionalProperties/anyOf/0"
> +        $ref: '#/additionalProperties/anyOf/0'
>
>  examples:
>    - |
> @@ -190,7 +190,7 @@ examples:
>
>              sdhi0_pins: sd0 {
>                      groups = "sdhi0_data4", "sdhi0_ctrl";
> -                    function = "sdhi0";
> +                    function = "sdhi0';

Huh?

>                      power-source = <3300>;
>              };
>      };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

