Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C701B70E
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 15:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729265AbfEMNck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 09:32:40 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:42954 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729204AbfEMNck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 09:32:40 -0400
Received: by mail-lf1-f41.google.com with SMTP id w23so9060504lfc.9
        for <linux-media@vger.kernel.org>; Mon, 13 May 2019 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oVp43Sqjer+1Mnk6Z0VYs6mjgMQjqnIkKEhzZtbnb9Q=;
        b=tDGuX543FaKiis5JIu0K6yHZUnYGszSy5/QKRscEBTPkyUx+UoxzMCda/f7NoAMCXs
         NnId1Dpy0+p2OwRYqNdUW8B0Q9ZgmTPPRLFH08Y8Ioi07swsdwSC8tzPEsKEOKEamJqj
         gT/Vz4YEL0/5DpBS87O6B2ToCKHpFCLejj/xQDME+AtG57xwr11T0CYu7sZfe3WWQ6uC
         Jyky4QwURWEXTpeUF+4ysh9GuY6S9jstJt7+MLrpUFMC8P78oitqRadqfNbc10j9sDcZ
         wEk4cZpnIYpoCxvVt7/1Wg3TXr9H9hvpVjqRLb0hGf6l5otIPkv0iOnrZ06bztaEDHYx
         UFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oVp43Sqjer+1Mnk6Z0VYs6mjgMQjqnIkKEhzZtbnb9Q=;
        b=Q4fwpWUUfXwmnwzyF8gsB1cef+THGNctwA/Doi0M5Z7sfIS7RGWQwGedjLmv9jop1E
         wMMKWEyJQyJxMdqZLEsPn24FiDDHiUHoa4xCeKAX4fEBFsFrtXEZVmm4jTw2yuXGITKM
         ek9npGdrhoES91Om/Vvcwrbs/fU3Ls2+XQBud+likWXB9czO20KsNKpF1arz0RL74GW8
         6naDG9q8bfLT4PwOyssWOUUhSFLh/+RQR9Y27sl430u0Z3e3QgJv7gy7oiUxtajG8urE
         QsDkKwgDjS7NILiwxidm9+bPIRZkDj/0+1KRON6rLLPCF+2L7br8uAxKc0gxZ58fc6wA
         LTXA==
X-Gm-Message-State: APjAAAUhS7NpHekZZmVdrjsp9Y0w3q8WQvI9uHi21tavyUAKs6+ddF5t
        mIUznQVqX4wKamzRdq39otpLQJbA1/L15MbxgKecsp3jdZw=
X-Google-Smtp-Source: APXvYqzs3d0cpCnpXUYy/HCWcuqMk6v3br1W7J29knRDRFtPEEfVrkkTiroqqAYfwnvhlnr9dDqBExHcoRhKAYA0yfY=
X-Received: by 2002:a05:6512:309:: with SMTP id t9mr13369150lfp.103.1557754357968;
 Mon, 13 May 2019 06:32:37 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 13 May 2019 19:02:26 +0530
Message-ID: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
Subject: test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
To:     linux-media@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
kernel branches ?

test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1132):
reserved not zeroed
test VIDIOC_G/S_PARM: FAIL

Test passes on mainline, -next, 5.0 and 4.19
Test failed on 4.14, 4.9 and 4.4

steps to reproduce:
       # boot any 4.9/4.14 kernel on x86_64 / Juno / hikey  device
       #  install v4l-utils package
       # modprobe vivid.ko no_error_inj=1
       # v4l2-compliance -v -d /dev/video0

Full test log,
https://lkft.validation.linaro.org/scheduler/job/708755#L1791

Test results comparison on all branches,
https://qa-reports.linaro.org/_/comparetest/?project=22&project=6&project=58&project=135&project=40&project=23&project=159&suite=v4l2-compliance&test=VIDIOC_G-S_PARM

Best Regards
Naresh Kamboju
