Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6FA6CE88
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 15:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390512AbfGRNDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 09:03:52 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34234 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390481AbfGRNDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 09:03:52 -0400
Received: by mail-wr1-f48.google.com with SMTP id 31so28659203wrm.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=wdW1IxHUNfhZU9arrmVrZEqXE8W4z4RuAF42l4LeLeo=;
        b=KWuBGtTlqyzOgmeVWAM4lrIPOk2l/MRmHLbJiinIhz7wNAFP2FPbmG1dzAFdkkNsqc
         oXX1n5CYXagolXAOfArNn24z+yR8aC4vHTC67tx3QQgzmOc7UpLhMk6EqTcw7KgItgXN
         ZfeCRErQTnhL6ZRPigleUGZRqLUk+eEi4f+d03cPFy5gcacpNS13DhX3zNmwhgyJ2+pV
         O1zo2gGHqJmH5QVtuC6KfY65DVyV8WLNXaH5rN/r6HXdbtbCzbYoGDmTo40FKVgnppMU
         tbLxvv20q8Mb5lxHiqEUu3EHYrWG6S7p9WDQqjV9SyI77JCwnKjNSxsdb+YjIb7AmCFH
         GvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=wdW1IxHUNfhZU9arrmVrZEqXE8W4z4RuAF42l4LeLeo=;
        b=ejnFoNykrodb7IWEQyM/uy6HADfG9x13BKdIIKac8aOmuzKiluZK0ooVvsiEyFDY7N
         Dhq+7fATnJe2eup8FWIjH95JQChytpZQeeOFMBDNtbTHv+A7Es5vBp8Uuk+k1JqEtqM/
         FsFrSKWGQw2AGkDZKZGjUYKkK+W+OMR7584tCSny8mrDMoHmdJOJw8iyxv6KyqwMiemh
         IrQBlPpUS/1c+b2K0mG+oITGvU7dhm+6f0j6f4qLi3OMvqbFjbYcyqFEa4faS9yA4vt9
         hz59x26Zm23RVw+aAIpF7e4lxAeBkRJ0FHc+hnExLroXuXmnDRfiUfGP4/dFqTVFpRB7
         xcgw==
X-Gm-Message-State: APjAAAVX2UB6GUqOBoDxlal7z6LeDxLkN2Bls8jKfKHNz0ACg/T6GfeB
        d9nHn7J0B0pEVHEEJc5xaKl5rXrT
X-Google-Smtp-Source: APXvYqxw89VzqFIP1oPQMLuYC2aTdJNB9gm4WkfjSdfO1lSx0Jf31SgqSimVUf5jzXLXGuEn3lARtQ==
X-Received: by 2002:adf:c803:: with SMTP id d3mr26973128wrh.130.1563455029206;
        Thu, 18 Jul 2019 06:03:49 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id a64sm27522918wmf.1.2019.07.18.06.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 06:03:48 -0700 (PDT)
From:   Laura Nao <laura.nao@kynetics.com>
Subject: Issues with ov5640 camera on i.MX6Q
To:     loic.poulain@linaro.org, linux-media@vger.kernel.org
Message-ID: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
Date:   Thu, 18 Jul 2019 15:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Loic,

I'm having some issues with RAW8 mode on the OV5640 camera and I'd like 
to kindly ask for your advice, as I saw that you added support for RAW 
mode in the mainline kernel driver.

I'm trying to capture some raw images on a i.MX6Q based board. I 
configured the pipeline as follows:

media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"

I'm capturing the frame using v4l-utils:

v4l2-ctl -d /dev/video5 --verbose --set-fmt 
video=width=2592,height=1944,pixelformat=BA81 --stream-mmap 
--stream-count=1 --stream-to=bggr_2592x1944.raw

The images I'm obtaining are completely garbled. I tried both 5.2 
mainline and 5.1.18 kernels.

I'm able to correctly capture YUV frames in all resolutions with the 
same driver (with the pipeline configured to go through the 
ipu1_ic_prpenc node first).

Do you have any insight on what might be causing these issues? Is the 
PLL configuration supposed to be changed when RAW8 format is selected?

Thanks for your help,

Best regards,

Laura
