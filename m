Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3516722CE7
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 18:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjFEQsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 12:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjFEQsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 12:48:42 -0400
X-Greylist: delayed 550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 09:48:39 PDT
Received: from mail.spahan.ch (homer.spahan.ch [IPv6:2a01:4f8:222:842::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3FE0D2
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 09:48:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.spahan.ch (Postfix) with ESMTP id A66D91C1BE7
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 18:39:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at spahan.ch
Received: from mail.spahan.ch ([127.0.0.1])
        by localhost (homer.spahan.ch [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AVL-S2VhkHPI for <linux-media@vger.kernel.org>;
        Mon,  5 Jun 2023 18:39:16 +0200 (CEST)
Received: from [IPV6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c] (unknown [IPv6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c])
        by mail.spahan.ch (Postfix) with ESMTPSA id 82A641C0506
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 18:39:16 +0200 (CEST)
Message-ID: <468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch>
Date:   Mon, 5 Jun 2023 18:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Poncho <poncho@spahan.ch>
Subject: Webcam LED control regression
To:     linux-media@vger.kernel.org
Content-Language: en-US, fr-FR, de-CH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With kernel 6.3, the LED of my C922 Pro Stream Webcam is no longer 
controllable.


With kernel 6.1 v4l2-ctl --all returns:

> led1_mode 0x0a046d05 (menu)   : min=0 max=3 default=0 value=0 (Off)
> 	0: Off
> 	1: On
> 	2: Blink
> 	3: Auto



but with kernel 6.3 I get:

> led1_mode 0x0a046d05 (menu)   : min=4 max=4 default=0 value=0
> 	4:


Full output bellow:

> Driver Info:
> 	Driver name      : uvcvideo
> 	Card type        : C922 Pro Stream Webcam
> 	Bus info         : usb-0000:00:14.0-9
> 	Driver version   : 6.3.5
> 	Capabilities     : 0x84a00001
> 		Video Capture
> 		Metadata Capture
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04200001
> 		Video Capture
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : uvcvideo
> 	Model            : C922 Pro Stream Webcam
> 	Serial           : 6E8DF1BF
> 	Bus info         : usb-0000:00:14.0-9
> 	Media version    : 6.3.5
> 	Hardware revision: 0x00000016 (22)
> 	Driver version   : 6.3.5
> Interface Info:
> 	ID               : 0x03000002
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : C922 Pro Stream Webcam
> 	Function         : V4L2 I/O
> 	Flags            : default
> 	Pad 0x01000007   : 0: Sink
> 	  Link 0x0200001f: from remote pad 0x100000a of entity 'Processing 3' (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> 	Width/Height      : 160/90
> 	Pixel Format      : 'YUYV' (YUYV 4:2:2)
> 	Field             : None
> 	Bytes per Line    : 320
> 	Size Image        : 28800
> 	Colorspace        : sRGB
> 	Transfer Function : Rec. 709
> 	YCbCr/HSV Encoding: ITU-R 601
> 	Quantization      : Default (maps to Limited Range)
> 	Flags             : 
> Crop Capability Video Capture:
> 	Bounds      : Left 0, Top 0, Width 160, Height 90
> 	Default     : Left 0, Top 0, Width 160, Height 90
> 	Pixel Aspect: 1/1
> Selection Video Capture: crop_default, Left 0, Top 0, Width 160, Height 90, Flags: 
> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 160, Height 90, Flags: 
> Streaming Parameters Video Capture:
> 	Capabilities     : timeperframe
> 	Frames per second: 30.000 (30/1)
> 	Read buffers     : 0
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=255 step=1 default=128 value=128
>                      saturation 0x00980902 (int)    : min=0 max=255 step=1 default=128 value=128
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                            gain 0x00980913 (int)    : min=0 max=255 step=1 default=0 value=0
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
> 				0: Disabled
> 				1: 50 Hz
> 				2: 60 Hz
>       white_balance_temperature 0x0098091a (int)    : min=2000 max=6500 step=1 default=4000 value=4000 flags=inactive
>                       sharpness 0x0098091b (int)    : min=0 max=255 step=1 default=128 value=128
>          backlight_compensation 0x0098091c (int)    : min=0 max=1 step=1 default=0 value=0
> 
> Camera Controls
> 
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> 				1: Manual Mode
> 				3: Aperture Priority Mode
>          exposure_time_absolute 0x009a0902 (int)    : min=3 max=2047 step=1 default=250 value=250 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
>                    pan_absolute 0x009a0908 (int)    : min=-36000 max=36000 step=3600 default=0 value=0
>                   tilt_absolute 0x009a0909 (int)    : min=-36000 max=36000 step=3600 default=0 value=0
>                  focus_absolute 0x009a090a (int)    : min=0 max=250 step=5 default=0 value=0 flags=inactive
>      focus_automatic_continuous 0x009a090c (bool)   : default=1 value=1
>                   zoom_absolute 0x009a090d (int)    : min=100 max=500 step=1 default=100 value=100
>                       led1_mode 0x0a046d05 (menu)   : min=4 max=4 default=0 value=0
> 				4: 
>                  led1_frequency 0x0a046d06 (int)    : min=0 max=255 step=1 default=0 value=255
