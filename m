Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EAB638827
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiKYLDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiKYLDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8182A4A9F1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TfA9A7l0JYE/L8ETH4uO/o+2VqeJpw2uLOXbWd1Oacg=;
        b=cOs55s00e/Wl3fvKxkBzQDza+crRl16Toy0Iodjocnhq/x+THr53vG9RtZGT58Wh+9q/Ky
        tOw4dFmpTaFqD1zVVPF1Afasc5bmfVgSw2c/rqMCOoRJeD69rvMYw4Wo+R/Tk70O7NLmUI
        FJOOZ9C3TOjWA4lP1Fnk1nrey4hSrCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-IFEGOWs2P5-gpVMS0K5bPw-1; Fri, 25 Nov 2022 06:01:53 -0500
X-MC-Unique: IFEGOWs2P5-gpVMS0K5bPw-1
Received: by mail-wm1-f71.google.com with SMTP id p14-20020a05600c204e00b003cf4cce4da5so1691817wmg.0
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfA9A7l0JYE/L8ETH4uO/o+2VqeJpw2uLOXbWd1Oacg=;
        b=RyrRgXN4O+fMHe1/yOz7mnek5302JprGhpfVTmBYddyyt+e1+kaFe55Onnvljzw+8L
         1uyMHCk53HA0pTR6YvPD1OayYxJ5z8w2AZBA/U1apmlG+QcKxGm7A5oFRxnttDBnJTLW
         NZDt7ZxqOu88Nh8c7/oXZh0PNekuv/oiXZBXXuC2eDOBP0KlgdxTOJy727AREO0GVlzd
         bST2V1V+lcNiFCnO40Fnpib935wklzjCrMk8KKfZMdOpWSNJHPsWp/JcUW0jNk70xa99
         izjTOSn2/0jMWGLp2uoThUEq6WOwxKOzbPWf+oncWbcU7GZDmVJZsJ8acJ0vjHJblCt8
         MhYQ==
X-Gm-Message-State: ANoB5pnVibF09RO5CfSZ42IbM5NZ1X70UNENUCy/9ENHnTBEF1CJnYlD
        Uql0Yx1XJx1SwTnq6XONuyLHdCAxKBwA4aOo4AZA4JlcaIVqvM6IIxsj+MoM6O1PJNwNQxBVRuQ
        bJTMvP88hFoOrdlt3rwfwuEU=
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id l22-20020a7bc456000000b003a5f600502emr18311888wmi.39.1669374111357;
        Fri, 25 Nov 2022 03:01:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54zF2uRxU4RbTU39UVEvJ1RZet14YgzdlvBFjd7gpCV0KEEizmQ7IkJumuXXzHwnc2Bml0/Q==
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id l22-20020a7bc456000000b003a5f600502emr18311846wmi.39.1669374111092;
        Fri, 25 Nov 2022 03:01:51 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b003a84375d0d1sm9723651wmq.44.2022.11.25.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:01:50 -0800 (PST)
Message-ID: <8df31d1d-1ed9-eb6e-80bd-1f82adfb0185@redhat.com>
Date:   Fri, 25 Nov 2022 12:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 11/24] drm/vc4: Constify container_of wrappers
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Gow <davidgow@google.com>, linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
        linux-media@vger.kernel.org, kunit-dev@googlegroups.com,
        dri-devel@lists.freedesktop.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-11-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-11-051a0bb60a16@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/23/22 16:25, Maxime Ripard wrote:
> None of our wrappers around container_of to access our objects from the
> DRM object pointer actually modify the latter.
> 
> Let's make them const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

