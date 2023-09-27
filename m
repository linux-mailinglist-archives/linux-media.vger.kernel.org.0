Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 782EC7B02B2
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 13:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjI0LX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 07:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjI0LXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 07:23:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB63F3
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 04:23:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED28C433CA
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695813834;
        bh=OILtlPC6/2OjZjVelOzbiJgoBS+mbmNhYWvAf8vxecw=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=UGUA5TMTWJOWDVNfaKtoY1WTWi5Q97Su8Z3g1f1lOUVuzoSoRFdEM033ZWwr25S43
         EvZAoFel4CwbTZ9mFL/dZlou4YLw47+XVZPwxBmNWML/qWiw1iNBeVUksYv4v6//Kj
         8AM7lo2GzYRsg5Fvl9/5lSfEaelobyhxBk6yv0lCMOxsk8KsebFWu/yVJOfhVoiAem
         8QZI+KTelHt2fqqxLWccwgzw0f2EDhqz9vZiY02/4uhiXgUiacROfLZx/CxfWhHipv
         ICfxZjSsHCm8I9K0L7abEIjJ69oypbCN7AFV+eidkUSHyXKoWPfaI4VocrZlUeqMXg
         lnqBlDIAb+hgQ==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id E779727C0054;
        Wed, 27 Sep 2023 07:23:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 27 Sep 2023 07:23:52 -0400
X-ME-Sender: <xms:yBAUZdiPm3gV_D9oNYFzML6aJlokEe6Lc1kiCklrem1Tz_tqTBJGcA>
    <xme:yBAUZSBrjlAA5N8AUgJn2ksGdTf9mQSwMcYttvr0Qyqw0OjuIgRObBz7VceFCmQvs
    xolduupdFgXkfo_QU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdefgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeehudeg
    tdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:yBAUZdG0wrlhW1U4zbC24QU9Mq87Gb_haeUBHWGBNAiwxd4-wCwhYA>
    <xmx:yBAUZSQv6jkGF4onHdAN9DuMR1gX3aC7ANhjBVF_QXb6LXtllO7dXA>
    <xmx:yBAUZawuhPge47uBiHxVp3tSMGyOeIZeKyBUWz9HapQeqk6Z9AsJlw>
    <xmx:yBAUZV_lrXEbu8QpEwH7O0nbMEH7-M0yAjkaupbGnyB2YRgONRnWVg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 57351B60089; Wed, 27 Sep 2023 07:23:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <f246ffd9-b061-4ac2-add6-18d9288673ad@app.fastmail.com>
In-Reply-To: <20230927105112.705998-1-sakari.ailus@linux.intel.com>
References: <20230927105112.705998-1-sakari.ailus@linux.intel.com>
Date:   Wed, 27 Sep 2023 13:22:49 +0200
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     "Bingbu Cao" <bingbu.cao@intel.com>,
        "Daniel Scally" <dan.scally@ideasonboard.com>,
        "Hans de Goede" <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] media: ipu-bridge: Fix Kconfig dependencies
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 27, 2023, at 12:51, Sakari Ailus wrote:
> The current Kconfig symbol dependencies allow having the following Kconfig
> symbol values
>
> 	CONFIG_IPU_BRIDGE=m
> 	CONFIG_VIDEO_IPU3_CIO2=y
> 	CONFIG_CIO2_BRIDGE=n
>
> This does not work as the IPU bridge API is conditional to
> IS_ENABLED(CONFIG_IPU_BRIDGE). Fix this by changing the dependencies so
> that CONFIG_IPU_BRIDGE can be separately selected.
>
> The CONFIG_CIO2_BRIDGE symbol becomes redundant as a result and is
> removed.
>
> Fixes: 2545a2c02ba1 ("media: ipu3-cio2: allow ipu_bridge to be a module again")
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for sending the fix, looks good.

     Arnd
