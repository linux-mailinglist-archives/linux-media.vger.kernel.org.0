Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150EE11E8B3
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbfLMQvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:51:21 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34986 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfLMQvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:51:21 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so97513pgk.2
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=CAKYbgJOuPrQjZzMU15duDzEPoqOHPryHWVB0LlLVJ0=;
        b=Y9roHoe4knC/3BeSYJfMTn6bay+pT2YhyVNHvcWdl3A8J7dp63no9Ekvt1JsYnoaHY
         vixMt2a9ZIF+VpZCiLfqaF2+Qi91TDmH48MdsevifKtcEMPwo8ThbhsPJtVU/DX3SPGT
         hozgRBw67+xOvh61BGiu/pj8aspFRnxjXdEAx9WReUQNZcfB5mw4371fWOrp/1xZSa25
         DjaByZ9CuvGnurGZFRES5Thm6CY+r6na325r5TRh9PVZDAykJPzB8gcpQDig6tzpk1nQ
         gE+1JvbnCl7LRzMaO9F7wvvv0XpXmTLwYcpXgri3ros2x8HNdTjJkIbRG9NX/W5AcVjP
         BIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=CAKYbgJOuPrQjZzMU15duDzEPoqOHPryHWVB0LlLVJ0=;
        b=Ob1I/zR57d7idKIHUdmu11IUZWHq+AhtlaDhTv6QxQn+uS4vfWxFKLol1O2tHOz7hr
         VFwOIuQUHU1wuCS9TI4MZ9ZTCrfWii/oArnZHQeiOqCERrENw5Vmld8elyLpqTYjvk59
         d77x8VFeQaBP4Gem+ejqkcvLm1uYNEAi3Lqyy3J5W7ijrtO4++CZxDt5IIhmc1cNkKC3
         WWXo8cJKds/k95qIjZ/qhXqXahJC5Iqg5PYcG/4ndkcuhELEIc26nQrVAXQ2rypCbiQq
         CHU/cR+C5kvbyXFSfTQn0BHDBYXlWmoxPlQcfu8D1GA4p3MMTC6Aq9vTTJpEGomsajBr
         A10g==
X-Gm-Message-State: APjAAAXljV5DDdrzRzKiz1sYc7b7p8Gjar6r6/m1koyoPw35hkRSSbxo
        /TwuR5RNKyC2mygH7YPqmO759g==
X-Google-Smtp-Source: APXvYqx8c6YOAASRXq1y4Uky+FLljcRzDfb1EqKwF5yKxzGUufqLyOLiT0Js4vaXwqrz7WYzNKz0zQ==
X-Received: by 2002:a62:5544:: with SMTP id j65mr381415pfb.121.1576255880888;
        Fri, 13 Dec 2019 08:51:20 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 91sm10649806pjq.18.2019.12.13.08.51.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 08:51:19 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, mjourdan@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson-g12-common: add video decoder node
In-Reply-To: <20191120111430.29552-5-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com> <20191120111430.29552-5-narmstrong@baylibre.com>
Date:   Fri, 13 Dec 2019 08:51:19 -0800
Message-ID: <7hwob088zc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Maxime Jourdan <mjourdan@baylibre.com>
>
> Add the video decoder node for the Amlogic G12A and compatible SoC.
>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.6,

Kevin
