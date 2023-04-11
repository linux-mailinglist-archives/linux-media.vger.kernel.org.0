Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3823B6DDFEA
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 17:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjDKPsA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 11:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjDKPr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 11:47:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B4AE6A
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 08:47:58 -0700 (PDT)
Received: from [IPV6:2804:14d:72ba:89f6::54d7] (unknown [IPv6:2804:14d:72ba:89f6::54d7])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E9B6A66031EA;
        Tue, 11 Apr 2023 16:47:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681228077;
        bh=ZcvrO+eaFVKRQpdHqQaYitXrlR4GfdgYyAjU9hfHTt0=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=eLpGzvSxrk134jKThjG9E15lZpXJh/x6oR9k7Hxm2n9K7nig0W+GVf7eScaRSoQp7
         +07o180w1neLxEAlJnGt58YrHUYzyTWjMua8u5CwBMu3rB08Jwu/wn4Af15+GrXt26
         uvX3MA9gDg7OX4vjEUXCObXFS9BKaUw6hKVS1HVblOF5LQXtJCBtKwiUrjjMm2ySJx
         BYXaJSFTDzU5wgqLiuNVmA1nFcJQ63ma/Ud2CAJSmdrtiZM87g/fBaW60pejBrUZSN
         33Bzfr7FfLBkzG2qRnPk6M/MQs94K4Y6IpIdkHULEoLxNpOi2jtaQgrCyG9m1KfSwN
         8WKxRtGLgYyRA==
Message-ID: <cb73fb12-9588-63f1-12b6-efa9a2407559@collabora.com>
Date:   Tue, 11 Apr 2023 12:47:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Language: en-US
From:   Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding mine:

Rust V4L2 support:

Discuss the potential blockers as well as the roadmap and priorities for 
bindings. Present what is currently supported and what isn't in the Rust 
code for V4L2. Identify potential candidates for new drivers that can be 
written in Rust. Discuss about maintainership issues related to Rust in 
V4L2.

Guesstimate: 45 minutes
