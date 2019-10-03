Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD1CCC997D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 10:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfJCIGp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 04:06:45 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38427 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfJCIGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 04:06:44 -0400
Received: by mail-wm1-f68.google.com with SMTP id 3so1489382wmi.3;
        Thu, 03 Oct 2019 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXigJG4LELNTM8UABCUgm8WM261Rfjsw8vh5tHj3WaA=;
        b=Ysy44O1qp+WXVMnZyQI5aJrdJjOeMmcQX3mJNELqGlWvXZpvkc9igv6a+fw2mDC8vZ
         lM4DAesdBzROCbg+wkeLs76jXwXqXyFQakHHWqRqnXZcsEpViE6Sj0jlg2jyqjmPCeK8
         ZITK6Em1dDK9/FNJbD/PMkijscRNHE5KdbSXgJf7mQNxO1rjpLOREvGuf4wx+ILTvfQE
         iOG6KDHOTHqoukz+HUykckcVXjagTXQkjAB8DeMEJhvq+RBH6qXPkdX5/2wgP/gLW88N
         9X+BGmTRO9dwqOrm9/qNAzXEeC6kHQYR1temTsXTd37ZEwFGRt+2jquJKe8Ksv5+p1Vc
         UbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXigJG4LELNTM8UABCUgm8WM261Rfjsw8vh5tHj3WaA=;
        b=DAvDrTxwT/u8IVSMMV0HIdX6KizS4A/tjJFflcyxOP7jWme2eE9iS9Byo6VZjtOYfG
         7KjHK9/Ulo/8b6Gcm6pySRiPCUj7KnFrd65tBctnuthPz33BXBDTPB6gW6jS/kSXHMp5
         3vFM/NC4GPNyOcQJyfNS9eEg5Hvnh3b7/KhOS2ucR4sbhwmOkRbceUXLGf5w5R0wln1G
         FQNNKOlGWQ3/wKc2dWjJ+CYaaCKo+qp0EZKi1/fbtsHLMg6U8KuuTyeyhzgzGeabEBiS
         hFMWsoVidwlJMnjRF0XqQiaUYKabyRQi+iQku2nnuT0Zf4EQCLwhlHCOxqBabqWbEBL+
         DSSw==
X-Gm-Message-State: APjAAAVzDUprjWyKZnDdOtqVfkx1x+dZsMN0CR/QLh+hOf3RpSI0xBIV
        YN50ALlkFDOMQBCXeGoj4lo=
X-Google-Smtp-Source: APXvYqxtvwqU7mXTzVD/3O6NSQDItjUtF/OaCiPoG+cV6rklLANEJZFc481it73Lfp7mzWlsPNm6pA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr5722385wml.157.1570090002729;
        Thu, 03 Oct 2019 01:06:42 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.168])
        by smtp.googlemail.com with ESMTPSA id w7sm2355064wmd.22.2019.10.03.01.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 01:06:41 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 0/1] Testing timing patch for Logilink VG0022A
Date:   Thu,  3 Oct 2019 10:06:19 +0200
Message-Id: <20191003080620.3885-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002154922.7f1cfc76@coco.lan>
References: <20191002154922.7f1cfc76@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

I tested the following patch on a Ubuntu Disco Dingo kernel.
Unfortunately it fails with the following error message:

[    3.715233] dvb_usb_af9035 2-1:1.0: prechip_version=83 chip_version=01 chip_type=9306
[    3.718385] usb 2-1: dvb_usb_v2: found a 'Logilink VG0022A' in warm state
[    3.718479] usb 2-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
[    3.718544] dvbdev: DVB: registering new adapter (Logilink VG0022A)
[    3.720006] usbcore: registered new interface driver usbserial_generic
[    3.720018] usbserial: USB Serial support registered for generic
[    3.729819] si2168 1-0067: probe failed = -5
[    3.729826] si2168: probe of 1-0067 failed with error -5
[    3.731138] usbcore: registered new interface driver dvb_usb_af9035
[    3.732728] usbcore: registered new interface driver btusb
[    3.742576] media: Linux media interface: v0.10

Did I forget something or is it just not working?

Anyway, thanks for your effort. Can we try something else?

g


Gon Solo (1):
  Test Mauros timing patch.

 drivers/media/tuners/si2157.c         | 32 ++++++++++++++++-----------
 drivers/media/usb/dvb-usb-v2/af9035.c | 14 ++++++++----
 2 files changed, 29 insertions(+), 17 deletions(-)

-- 
2.20.1

