Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6C85A14BB
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242244AbiHYOo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242261AbiHYOn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:43:59 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B86AC269
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:43:29 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c20so15338290qtw.8
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=2regcVCqXwbxHoTw04f/rfbAoWJ6XLsaJDlyQStoVAE=;
        b=pJn5io5H0jjAbNOTzYRz9aowNRtuef0YnPebQuInkmKCGdhtv47I/Cp74Zz0vL3IMK
         MiTMO2BUp9VmlFhcgu50OVc1nwJKYK46tfZDnsrBGgbQEqo0p7FwWAwWEM2H4Q0dxc4C
         D8EX02fYyIkERG7LiBAKnGzRiDWFGQkQnKWxrNstYh0u3UxiSenwrMkjlDwBZ2Wx86kr
         G5E//5T/NhixFnrVzkycZ47F4P3lZhsFHn23PPKLBxKPNR8CNebRGXBVa2EqY4ky7bgD
         fodiUYMBrwbfGZj3sy8W4pJU8gCXIL8uJDUnjNQNU0BSuZd9iS6JwdWLGZiKEFLuL2L8
         9WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=2regcVCqXwbxHoTw04f/rfbAoWJ6XLsaJDlyQStoVAE=;
        b=j3uXunuULSIg0mi4hDbwUF85rQpBCzPVl+AHRk81W9p7kpSFULrV5OKGLfmZ8QRsI9
         xiP5UnbdFv5vlvZmYVHmlc+Df4RkmsD2N/7Rvz2Epp5H0n9msHDz8Fd1KxEmgDxwdy8X
         MohnzdljuylN3bRWghm8vNyycbnXarv4P2x0qApY4gFD5RdJpJ451q2x2M0EAKP4ruvx
         5AxwCn0HhqGshxU8dOM1Nt6yMmOU2H3PmgXGBEfRoYy3hi8hnk2cU1zVyfKvQW1ogGqo
         gVWNclArxiRMUi3u1y+Ae0WYmADiKbRiNeDFejdfnQPS4brbkJiSc1HqOp0/KtiZHUFZ
         CiJA==
X-Gm-Message-State: ACgBeo2xaAJd+Oz+gzomq0mSObpAmULDNy/IjLIZwNLs7mT3Rz6/q5NM
        tly8LkbNXH5OrAE+6jdKQi8IPinUgSM=
X-Google-Smtp-Source: AA6agR7w1QknROC1pSLvPJ3GHFt9RBgMS4E9FREn7SjfJsVcugDGrUr7rQe1rbqnwtSaOoi1Rfla1w==
X-Received: by 2002:a05:622a:1492:b0:344:5130:4094 with SMTP id t18-20020a05622a149200b0034451304094mr3854111qtx.3.1661438608231;
        Thu, 25 Aug 2022 07:43:28 -0700 (PDT)
Received: from [192.168.1.103] (c-73-165-23-36.hsd1.pa.comcast.net. [73.165.23.36])
        by smtp.gmail.com with ESMTPSA id b15-20020ac85bcf000000b0031d283f4c4dsm15509172qtb.60.2022.08.25.07.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:43:27 -0700 (PDT)
Message-ID: <35680d5e-26f0-04f7-15bd-3be3317ffec3@gmail.com>
Date:   Thu, 25 Aug 2022 10:43:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   Rich Sahlender <rsahlender@gmail.com>
Subject: No Sound from EM2861 Device
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello - I have a USB capture device from ClearClick. This device has 
both analog and s-video connections and lsusb shows the device as:

Bus 002 Device 004: ID eb1a:2861 eMPIA Technology, Inc. EasyCAP DC60+ 
[EM2861]

Using the Qt V4L2 Test Bench utility and selecting this device and 
setting NTSC as the standard the video looks good from a DVD player but 
there is no sound. In the User Controls tab of the test bench utility I 
found the mute box was checked by default. When I uncheck the mute box 
and restart there is still no sound regardless if using the analog 
connections or the s-video connection.

The playback tab in the alsa mixer shows 100% for ALSA plug-in [qv4l2]. 
The input devices tab shows EasyCAP DC60+ [EM2861] Digital Stereo 
(IEC958) at 100% and Port for this shows Digital Input (S/PDIF) with no 
other choices.

I have read that many other EM28xx devices work well but perhaps there 
is something different about this one from ClearClick or I have just not 
set things up properly yet? Any suggestions on how to troubleshoot further?

Thanks.

Rich

