Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DACF11E8CB
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbfLMQxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:53:31 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41346 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfLMQxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:53:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so1460838plb.8
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=jZARGI2ljyaZUUzftM9FBJPmm5n1/FlWF5GqHksaDjI=;
        b=sgIfRKUhqdV6BDX8b6Kkhb8TzuupxC2yg76LGod3zYtqCfQ76L3DdNFNDiqlh9WLKE
         9dXGb4UmaQ8anwQHzY8aW4mJ/JTFQ1A2+Wiuf7DzNT3BN14t9RiR0KyPVztQRoaMoEA2
         I4n3IPzgUzElgqn4XqboDq4TwfFrfRlagOp59iq7mlIx7/pP//A7AZjbVfNEZwv1D8kc
         3p5wP4AmYPgcjL4ty3DlDOpiLvqFzQYolTT1qhp1PFI356oUi8LCyrHkkK4kjV7fBoPe
         +ewZOJ5RhrkySNjyqYEljIXs7JvW8wYj2XlZ/37DNMn2XLJKSmwntpP6ZtpTr0mXAzQx
         4MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=jZARGI2ljyaZUUzftM9FBJPmm5n1/FlWF5GqHksaDjI=;
        b=ka6cRLF9AEklEENOicAQyv2TZOxI6pWi4098POuYIWWpT1723zNcPcBXMg1fhaexGp
         vxeF0Kz9+ZoC52MLKvcUuAZLPihVr3ETd1zwQuhWfuTuFELeuyG4ya5n2Wqsg9mwcZs6
         syhZ45BCc5X+xhKz7HPuSL6jqNLMwpoEP+aUak0ajjwn6Cbz5SyVoOashkOkGEpslACC
         anKFsqrkwXyLaNVWVM3qHTH6YvHZ3ZSXHTPiK2gIVk/SihAs1CYjGl+7rvR997rh2OXP
         pRiBQBYBAQOg0fcqzETlKBNpsCp4LVg1LgiBe882bFtOLfeMU1nMRq6ievfpYsx675tQ
         UMFg==
X-Gm-Message-State: APjAAAWQOZluWgZOizLwGRHX8DwM/3FQIDGtWLfemXpNfaVxvMNCyNsQ
        nPJ8F7I18BL1kC9gQBorK+KhkQ==
X-Google-Smtp-Source: APXvYqwOTIE7mAAvzbQljivGwT1lZknrS5gskCeChmKf5NoyTIKMXUPpvw2+ULP/zm43ECQeQEQD2w==
X-Received: by 2002:a17:90a:c697:: with SMTP id n23mr302398pjt.37.1576256010397;
        Fri, 13 Dec 2019 08:53:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z1sm12336131pfk.61.2019.12.13.08.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 08:53:29 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, mjourdan@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: meson-sm1: add video decoder compatible
In-Reply-To: <20191121101429.23831-4-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com> <20191121101429.23831-4-narmstrong@baylibre.com>
Date:   Fri, 13 Dec 2019 08:53:29 -0800
Message-ID: <7htv6488vq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the video decoder specific compatible for Amlogic SM1 SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.6,

Kevin
