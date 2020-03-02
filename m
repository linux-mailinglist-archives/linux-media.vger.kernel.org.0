Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906ED175F85
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 17:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgCBQYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 11:24:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35176 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgCBQX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 11:23:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id m3so11257877wmi.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=UaXmfdRD+RogZavDsWZ2Xu1muVDHx7qL1cRXMVQIaG8=;
        b=jCAh83IS11VcYAMyCg2IKY9ysFWiPlOllIQwqJIKu7LC0UgfNy/0YUshkg8sAsIixe
         T2tyJDMQmlUIRqvBWjVkkApLb0zj4ihySmriBj4rcrCdnF4G5NYI5sqxEfjhu4wLCcJm
         U9LPB8Xufr4d9P5gGp4lFXy1T3BYpjfEQgVc1NiTXuUdr4890HIcNTAtpHq6AL8le/WO
         gH90ODQ/OXDQtPnMnRvclPrHaaH8rQixBMs1KTJNTyQxfYN1XLIJ/pG3BM8JEANL9lvs
         VvHDtqg6YN561nKG1P3doe523Sf+y3jXbfL9CwPS544mxt3KnDPztlKlV8IOjHyPIqz3
         AfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=UaXmfdRD+RogZavDsWZ2Xu1muVDHx7qL1cRXMVQIaG8=;
        b=NWKjC4JNwdnHXv3PR409GQZ9p1G0h0CcCX2IMT41rwG2QUtvX0eFefmvlIxRexisgN
         gPU1lL6Oz2IB0VbhE5x9TeWBvFJHeRHdYwuQgNVqXreTg5G0a4YR558TOFZ9QqVNQdjA
         PCKHpJJht+LGAF2YDtmt1rnKtgFs8njGRseAN/Ag/ZfV6I9Rifwo6XgtFefxriEOG+P7
         Ymb71ir115fbLOVlmwHDkmXYva01YwlyFCdku1b3+xLgXFI6FdVqS+z2vuSXbHQNQg9B
         H/sMJcMRo/BHXsd+LkVqr6CbVWhU71cC28fLg5Kir0QSbdvawKBahpyDNPZWcwAIxe15
         whBQ==
X-Gm-Message-State: ANhLgQ037KY3EaIdmzCNsDL8h2qG/uYFlVNNvvaC33cTkz1DJeSqenx8
        ZVs11XNKe7cdXPPDx09dC5JG6A==
X-Google-Smtp-Source: ADFU+vv8D6CdaqmTDhr7fwgQwP+TsU7dihlNiEMXFNlusa/13yIpEeBBvpYiQrJfUxeUtmQvHgtsHA==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr200544wmc.152.1583166236090;
        Mon, 02 Mar 2020 08:23:56 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d7sm18821187wmc.6.2020.03.02.08.23.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 08:23:55 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 0/5] media: meson: vdec: Add VP9 decoding support
In-Reply-To: <20200219140958.23542-1-narmstrong@baylibre.com>
References: <20200219140958.23542-1-narmstrong@baylibre.com>
Date:   Mon, 02 Mar 2020 17:23:54 +0100
Message-ID: <7h1rqasp2d.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hello,
>
> This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
> platforms for the amlogic stateful video decoder driver.
>
> With this, it passes v4l2-compliance with streaming on Amlogic G12A and
> Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
> pyv4l2compliance script for VP9 at [2].
>
> The original script kept the IVF headers in the stream, confusing the
> decoder. The fixed script only extracts the payload from the IVF container.
>
> The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yuv420
> samples and the VP9 Decoder Performance streams at [5], decoding all streams from
> Profile 0 and 2 up to Level 4.1, with 10bit downsampling to 8bit.

Tested on meson-sm1-sei610,

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
