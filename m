Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B520E8C2D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 16:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390202AbfJ2Pxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 11:53:39 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41977 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390070AbfJ2Pxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 11:53:38 -0400
Received: by mail-oi1-f196.google.com with SMTP id g81so9328034oib.8;
        Tue, 29 Oct 2019 08:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ee/ZfDHCgHXLdYgZabX3kaZDRAeev7SjMlCPaZQOUW0=;
        b=fTCeytEUPBuiOQh6phlXV8HcZFICK3yb6EIu2x7rp3PuVEbx4eK6q4l6gSbVVnT8Uy
         L0fDXKHiVtOlltiBPC9wuKiukQUcODhGMppUuZsPt+izHRB0RrvkrXZpp2oNpD5eGimk
         7qJQxbsay2P56QEygRXRP3pbkBJ70wYIvAl35MG2thq7xhHtxPVL7poshMEjDUJvySH3
         zNLHIDFy/aJxaPhf1d9NP0Z8Z2U+4err/9A+NG/X0agk9i2ap3OyN251fzgxI9Q1JoH8
         Ow0xznlSeUaa5nZriqIbV2aXTxZFUEY/TTBUAKX5oiufcjC1R+yv1KbedtzEKefyPXoG
         bKhg==
X-Gm-Message-State: APjAAAW0H+gaDR6qkxPd3rFRy+RWh+peIMedNJcVrHP94b+/QFtjbyJQ
        G2VMnDt/LqL/TJmeJZZbLg==
X-Google-Smtp-Source: APXvYqwX+atP99G6b+JeOlg/oDHgD3pIcU9XIkNskn3WlavIpip9mE2fAaNTZzDMv+xbES1LXkjkEQ==
X-Received: by 2002:a54:4187:: with SMTP id 7mr4731658oiy.158.1572364417951;
        Tue, 29 Oct 2019 08:53:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n127sm4164519oia.0.2019.10.29.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 08:53:37 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:53:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] media: dt-bindings: media: add new rc map names
Message-ID: <20191029155336.GA22429@bogus>
References: <20191021121249.25143-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021121249.25143-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Oct 2019 14:12:49 +0200, Neil Armstrong wrote:
> Add new entries for linux,rc-map-name:
> - rc-khadas
> - rc-odroid
> - rc-tanix-tx3mini
> - rc-wetek-hub
> - rc-wetek-play2
> - rc-x96max
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks.

Rob
