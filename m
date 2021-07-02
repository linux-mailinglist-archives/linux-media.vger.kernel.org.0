Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5043BA378
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 19:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhGBRJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 13:09:13 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33305 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhGBRJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 13:09:13 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.179]) with ESMTPSA (Nemesis)
 id 1M27ep-1lwteB44XR-002Yxw for <linux-media@vger.kernel.org>; Fri, 02 Jul
 2021 19:06:39 +0200
Received: by mail-qk1-f175.google.com with SMTP id q16so9980751qke.10
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 10:06:38 -0700 (PDT)
X-Gm-Message-State: AOAM5332rPjCPJSCX6F86WRr8+eyMw47KKoybBsGIGC1Ax+LZ6KFDsoH
        hbk4Dv3RkRt33cVe8glE7lLgc6rKQdZcvy5JZPs=
X-Google-Smtp-Source: ABdhPJyh3cV+Dz5wxeSuIgNnZumyk7CYE2p9GJSAm8sdzxpbg7kJrfFYdrfSGJXLu6Rc/+Ibmi3yfaGey/msg4afMJ8=
X-Received: by 2002:a37:468b:: with SMTP id t133mr755030qka.189.1625245597855;
 Fri, 02 Jul 2021 10:06:37 -0700 (PDT)
MIME-Version: 1.0
From:   Tony Houghton <h@realh.co.uk>
Date:   Fri, 2 Jul 2021 18:06:26 +0100
X-Gmail-Original-Message-ID: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
Message-ID: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
Subject: DVB reliability problems
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zK7kVf3Xo9eA+UoCru0l7Ev20NDp9C3kGemh3Q9EZ1TtN0PbBvX
 YA6z2v1HbKtYUwImM3Voc1gXZ7mRycTlulPv1hIZrEqsDbSV0yPtfhOjnW2/Eraem/T+Bt1
 T6TWlCn8d2ffledKU6vnV7jzvVu3kV+7k3ayi4XTXgtVmmP1RxnX7WnQSNRjJgeJUFKMCJ8
 uWGT5gZ5z5I44jQvBEuOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZkT/E8ngmqc=:N0FibO1CAQyV9ZD7pli28T
 n83c0pfzTQakfwZJDPoNCh7VVfCNoxUI8C/VMaLYMohyScK9J4C2AugQ/MHKK1ax9IZQOBEu2
 kzYjS51QiVLPCkrkWpS2h51WixiLcI6Ct/iUw1ucjs3P4Qre5Yr9LfOQjTKmeZ5HALORBGw1V
 uzTrdZ5jO4AVRQDtrSMe4UvIYi4Z2ICllCbp7sGvipwAHfzru51hTgVzrwFSIsOlZ1XA8zG0y
 SUp5Mm6V20KtS9dtBpmKERKnPUvs8gnU9wGe5ORPmEGAc1jORoZjzErLOvy7g8N6nGyzMVYkY
 TWqhNH6yOIeW5VZQq9QvMz9goK4+NFGdWlPNfrl1tEVBl20Dz9dvpqOdroxYu/BcJBerxaGLH
 qEqzF+fnrDGD1ComYHUwHlx+56DOTvzcITB7YMjsKCXx9twxw1hLOIBvbqO09xK7DIq5yxIqQ
 sPTXgmIMdlb7YBXjZQ2+FrmjxwZoBBAAAm6LsrGdfFNqrBhmYZ74W5sy5/F+2bJHS5x+RBILW
 pVG3jsyRsqThq++W2KOmfzswkjbr3tgi4AVJ3xLjkOSAcxW9cVn74FxGdr+okMO6xbRYY8oVz
 yY4gAFVWWLCXYi9mnUPUGu0A4U3Wl6WjFLddu6X8zoayRmfWphOHJe+0rMpGyQjvJcNl8o09f
 dt20FXf+d0xwpnK/9T7B29mWqJ+IWD+WemOL7ZU0CCEWtJwlr+7UASeRaEXQf/EkSIap7SeK5
 0Fd7IDw1L73PsCf7lqxKrLERb3dzE5qmS/TDmvN/1JxT7OiPsnXliXJj5iKv5S15l0vgRW3/B
 mhDk1FcpgaYDEPQ6OsSRh2p+Hui+kOY5ZtLPHIxyjLFJWZ/Yb4BypZOJJBFsgnyXfvTjUiA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I've been having problems with my DVB receivers lately. I'm not sure
whether the problem is in the receivers or their firmware, or Linux.
Some symptoms point to the card, some point to Linux (because they
should try to prevent the system from hanging even with bad hardware
if the hardware is peripheral?). Perhaps the majority of USB DVB
receivers are actually useless junk?

I'm trying to develop a good DVB PVR, but if I can't fix these
problems there's not much point in continuing. I hope someone can
offer some suggestions on what's causing the problems and/or how I can
diagnose them better, and hopefully get things fixed.

Frequently one of them will stop working. The main symptom is that
after tuning they fail to get a signal. If I don't "fix" it asap by
power cycling the PC (reboot seems to be inadequate) the situation
seems to escalate until the entire system hangs, either when trying to
use the receiver or at shutdown.

The problems seem to have developed or exacerbated mainly since I
started using an Intel NUC as my PVR and therefore had to replace my
DVBSky PCI-E DVB-S2 card with a USB TeVii S662 DVB-S2. After a while
it started exhibiting the above symptoms with increasing frequency.
When it got to daily problems I returned it under warranty and
replaced it with a DVBSky S960 V2. IIRC it has the same Montage
chipset as the TeVii; this seems to be the only chipset commonly
available in USB DVB-S2 devices. At first, the change of device seemed
to cure the issue, but that's started doing the same thing too.

Meanwhile I've also been using a DVB-T2 USB stick. At first I had a
Pinnacle PCTV 290e. That worked quite well until it seemed to fail
completely (not even detected by lsusb). I replaced it with a
"Geniatech MyGica DVB-T2/T USB" which I think uses the si2168/si2157
modules. This one's also unreliable.

-- 
TH
