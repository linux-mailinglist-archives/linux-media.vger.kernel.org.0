Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749964CA626
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 14:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiCBNho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 08:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242293AbiCBNhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 08:37:43 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B4FC1173
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 05:36:59 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so1259527wms.4
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=T5hRc5G5d9/1paIX2LfzbnvpuhJzk9VYmOzdlCoQE6s=;
        b=TXwWw1YpywLeotVZhJCICUnVpvPxW5KQ0g6n/1xLHIrjGIWFuOn0Q4lKjKtrKyB0Gf
         qhdfeKGCTNa3p+MZpCITzooT74Oopu+YCYnOzh+hV+phB2Awq9yb6cR7gOH63NH/HvXb
         8geohxiFTxn2Sqk2Tz4ESxYE4KYLYwZR6+z7HiC8qYH9fLAyfBQVHDeFkVyMB2YNv/qL
         owAN4yBxm330YG2mdveUdyQHS/IlsmP+JHyxwqoNEZ3VNkoCB8+DiWMA+iaU04uvGiGN
         0lKP4wG3mD+cI/L/9JR9pbZIuLPycDQsAPETday85jmzWwWo77E3HO+dRiQFNLIYNvkO
         NsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=T5hRc5G5d9/1paIX2LfzbnvpuhJzk9VYmOzdlCoQE6s=;
        b=pipMzHxhNrSURT+JleNvIPHOdaKlBELtJHtX4rhOmY/PaHMRnGNnJ94clzezaKPpx5
         DiVr2oi6mk8ZxoV7ER5/G72FoxGcYAQ3k/n4ma72oz8mh6wJpvYpS4LVyyK1hW8T8gWo
         3m2G3aQKXFoUfEKgsR6/YBHDd+wf1UBhP7CzvVshH0A2y2foPioDnjKa6NQvK5QBH+wb
         nI95ziF4lMjl2mi4Yuu991FK0NCKqwWPD7L46JpwXH367TZjEjyY5nSTNAedOXvMANZf
         LTRxpR41au1upILzOmddAA1thbFO7mfBvt8Z1i5mDYbPfNv5kvdEyOn6lb1mqSpEGuDD
         K/OQ==
X-Gm-Message-State: AOAM533Hltt791VOgQc2x1Jh+ykVbuUDhvhFu7ISiCfLvR/uR+fDLN7L
        9bOuOpRokA8/ho+YQt8yKSUVVcnjV5Y9bQ==
X-Google-Smtp-Source: ABdhPJwrOaMz1t0aeXDUNk4gJvHMES3GyB1kNA0JnA9MO5M110VjJq8eicnBGpe6mjz7yy4UoJnu7Q==
X-Received: by 2002:a05:600c:4e93:b0:382:b7fb:80b3 with SMTP id f19-20020a05600c4e9300b00382b7fb80b3mr3618005wmq.0.1646228217701;
        Wed, 02 Mar 2022 05:36:57 -0800 (PST)
Received: from [10.0.0.14] ([176.74.154.66])
        by smtp.gmail.com with ESMTPSA id o11-20020adf9d4b000000b001f0077ea337sm5580129wre.22.2022.03.02.05.36.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 05:36:57 -0800 (PST)
Message-ID: <0f581801-50af-8940-3c7d-695c61d846c4@gmail.com>
Date:   Wed, 2 Mar 2022 14:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
To:     linux-media@vger.kernel.org
Content-Language: en-US
From:   deim31 <deim31@gmail.com>
Subject: [bug] WinFast VC100 U no audio after video init
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, I've problem with USB grabber WinFast VC100 U.

Grabbing audio over it is OK till video is initialized. It hangs for a 
while and then audio input doesn't work till reinserting this USB 
grabber but it always repeats.
Tested on two PCs - with PipeWire and PulseAudio.

Tested with OBS, GStreamer

On Windows 7 it works OK but grabbing sw gives bad quality (compression 
problem not device's)

$ v4l2-ctl --all
Driver Info:
     Driver name      : em28xx
     Card type        : Leadtek VC100
     Bus info         : usb-0000:00:14.0-1
     Driver version   : 5.15.23
     Capabilities     : 0x85220011
         Video Capture
         VBI Capture
         Audio
         Read/Write
         Streaming
         Extended Pix Format
         Device Capabilities
     Device Caps      : 0x05220001
         Video Capture
         Audio
         Read/Write
         Streaming
         Extended Pix Format
Priority: 2
Video input : 1 (S-Video: ok)
Audio input : 0 (Line In)
Video Standard = 0x000000ff
     PAL-B/B1/G/H/I/D/D1/K
Format Video Capture:
     Width/Height      : 720/576
     Pixel Format      : 'YUYV' (YUYV 4:2:2)
     Field             : Interlaced
     Bytes per Line    : 1440
     Size Image        : 829440
     Colorspace        : SMPTE 170M
     Transfer Function : Default (maps to Rec. 709)
     YCbCr/HSV Encoding: Default (maps to ITU-R 601)
     Quantization      : Default (maps to Limited Range)
     Flags             :
Streaming Parameters Video Capture:
     Capabilities     : timeperframe
     Frames per second: 25.000 (25/1)
     Read buffers     : 4

User Controls

                      brightness 0x00980900 (int)    : min=0 max=255 
step=1 default=128 value=128 flags=slider
                        contrast 0x00980901 (int)    : min=0 max=255 
step=1 default=128 value=128 flags=slider
                      saturation 0x00980902 (int)    : min=0 max=255 
step=1 default=128 value=128 flags=slider
                             hue 0x00980903 (int)    : min=-128 max=127 
step=1 default=0 value=0 flags=slider
                          volume 0x00980905 (int)    : min=0 max=31 
step=1 default=31 value=28 flags=slider
                            mute 0x00980909 (bool)   : default=1 value=0
                     red_balance 0x0098090e (int)    : min=-48 max=48 
step=1 default=0 value=0 flags=slider
                    blue_balance 0x0098090f (int)    : min=-48 max=48 
step=1 default=0 value=0 flags=slider
                       sharpness 0x0098091b (int)    : min=0 max=15 
step=1 default=0 value=0 flags=slider

Image Processing Controls

                      pixel_rate 0x009f0902 (int64)  : min=27000000 
max=27000000 step=1 default=27000000 value=27000000 flags=read-only
                    test_pattern 0x009f0903 (menu)   : min=0 max=1 
default=0 value=1 (Black screen)
                 0: Disabled
                 1: Black screen

