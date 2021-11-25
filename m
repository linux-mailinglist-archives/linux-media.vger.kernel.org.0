Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA5E45DDDA
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356204AbhKYPsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356118AbhKYPqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:46:52 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B723CC061394
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:36:19 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id p19so6409011qtw.12
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jMuNFGHbzs56YzWhjYUx+AJIVCQliD6xMTtQipQWK+s=;
        b=zXYh0Augv9lvD1P0AicqdBWcjIiOLCf+7nPpuAGpPYOOm+uqo8QKhvu49SnrkrunNd
         9J4PetibZyCMnGzzTUOaImLcQjpiC3ErM6gxdAWxtyEOhCrJV7SBChByHOuRPozYouKU
         rL+rHCBs21vKYFpWvUqm0c4nKCEWjr4N5gOT5+U5TzCJll+oy8b8MwI9MLgK3/5ldiN/
         uc+vbmX0xpDCaVXf9hWnbxjfOIbHO7Lpc2ByEcjwIfh8wVK/AyN89FgCyNB17auSwKEG
         0C6gG0RefwqrwWFQAOcJhp8de1K18XFfdb+hCAcyCNhBlQ117CsvkuRvBdKTsWRl7OA/
         F0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jMuNFGHbzs56YzWhjYUx+AJIVCQliD6xMTtQipQWK+s=;
        b=sF955XRL69IwuwqOtTD350VV0uj4w+892JGsmm+rZsnSZxzSBVQqdhrcAlbKl/7FXj
         LO2eUNg54ry1W4CwS/qc6xJ6LRTQQOIo0oVQzek53fAEUQYHM8M+G728uizrYtD62j8t
         w1Bcdpw6eewjBYwm5ni+JO0+fhfrq8dvH8HOb6OOkifHOrUcIkzKl4e8d4YvppkvsCE7
         wFu96XeGtcIxhHa79hiIZ0YlrmuztFtllbhdfk8w4dAROrhPY1oeu5xvQVg6/8R3oA2k
         j5IhUWasGYU/zM2dviYDwPYuNPCy4DDV8clmzXykfwehR2CucNBXZOSUnU8ebTu5COTn
         pmjA==
X-Gm-Message-State: AOAM530NSX+25qdtCvmQHZpMv6/4kEvu5zkNjVgK0jLWSTsIEJb0bP/l
        8+DGxd4vNeP01Hf42GlhX+ZKeg==
X-Google-Smtp-Source: ABdhPJzj5/p7oV7NqHbuENyiEApxsd7MzAfC2Bvx9U9UBQBBHi13gcsdhffngBLjZvLrXWVjgdfqkg==
X-Received: by 2002:ac8:5a84:: with SMTP id c4mr9137047qtc.565.1637854578982;
        Thu, 25 Nov 2021 07:36:18 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id x16sm1686824qko.15.2021.11.25.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:36:18 -0800 (PST)
Message-ID: <0deb3fa15dd162d7c7b6dbe24821fdf9523dddd3.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 25 Nov 2021 10:36:17 -0500
In-Reply-To: <AM6PR04MB6341F599A97253C1BA812467E7629@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
         <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
         <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
         <9b7fd6802c89c5d3bb6a42b44f13a90f6c3caf22.camel@ndufresne.ca>
         <AM6PR04MB6341F599A97253C1BA812467E7629@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 25 novembre 2021 à 05:25 +0000, Ming Qian a écrit :
> For test [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) VPSSPSPPS_A_MainConcept_1,
> The vpu report an unsupported message to driver, so driver report pollerr to gstreamer.
> But this stream can be decoded using the amphion vpu when I test it using our unit test,
> I checked the difference, there are many vps, sps and pps at the beginning, 
> gstreamer will skip the first vpu and two pps, totally skip 56 bytes. It leds to vpu can't decode
> And our unit test won't skip anthing, so the vpu can decode the stream.

This specific test triggers a bug in GStreamer HEVC parser, I'm aware of this
one, and it is on my todo to fix (just not as trivial as it looks like, the VCL
nal detection code was implemented wrong and that ended up leaking into the rest
of the design). This specific test will of course be marked and skipped for CI
test that uses GStreamer.

regards,
Nicolas

