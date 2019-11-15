Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CAEFE491
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 19:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKOSG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 13:06:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39186 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfKOSG7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 13:06:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id t26so11406657wmi.4;
        Fri, 15 Nov 2019 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6UWtBa2Kzw3X+0O2QeqxOIJbox6WTM2kOiMfL2vFcew=;
        b=gLFbAr+AsV4bvxgU3MrdeB2VZD2V7/pQvaxpSUALj5mTkzYDY0jglHDJegG5qae3A1
         ELKzKW55HtE2TubWdpwCO2oVg5dqVlRrl2PqLN0/KXXV2Y4iGTczXRVnPxEA21JTUoNq
         +w/vNzrJil/o/YZOK21eMnARA30C9nVmqIgesVoDVT2zw804EwTfOsLsuuP4QRRG2XNv
         SSuwVJjDio30CRMBFXnapQeiumoUB67KfyZ/P3724DiF9z3AEbmrui/Qx8VeSklt64ub
         2YYe6NoEkwaZ3ip0Sy4NtJtevNDG4xcIfek1y8TgN/WPG1YntWoeOebUUEug2PhkCz0R
         W99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6UWtBa2Kzw3X+0O2QeqxOIJbox6WTM2kOiMfL2vFcew=;
        b=a3oJhxDmJ2XtOVKsTP7eYaKii5X3ZL2WjCvKxC912CZYgzt3e58jA8FomkbmVAIfcA
         U+7J+m7LDB3X99AcHor89HxlJpVlK4h9Z73w/TB6VqvrJkVObl/HKcWMjZSWHmBziSVC
         Lznt0C8Kl3+eP87x+bDXTaFZ2A4EHFgKlM7tfH/+GesDB6AYOr/dTiLH20YxIucLl7er
         8loj5YeDWhfkb8mZP4uBxnnSfHl5NZtDyxq4lLqcSSYPcrQTGY5v8DaKze5HNh9wnfK1
         36PbxSB3+EjLb/T4gHgbjq1tE+VS8mcZS3h73jFx6esfu+Ziw/iQzDTUZVqxytwbBb1g
         XMGw==
X-Gm-Message-State: APjAAAWBwd1kh6TKmcXGwaEESDlfKD2goI4Wbbz5M6WFoZh9rqOo6Ldn
        snHsfpSWkuq1AwZOqHEulto2OOxIQ7Y=
X-Google-Smtp-Source: APXvYqyZHsg6MMENYuNoXGxdwBVmQOBEQKT+7yXZykT8YsL6+xP/OM4biw8p4esKLLv3diRng2dXBA==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr15295169wmq.98.1573841217387;
        Fri, 15 Nov 2019 10:06:57 -0800 (PST)
Received: from Limone ([46.114.36.131])
        by smtp.gmail.com with ESMTPSA id y16sm12370586wro.25.2019.11.15.10.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:06:56 -0800 (PST)
Date:   Fri, 15 Nov 2019 19:06:53 +0100
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        kernel-team@lists.ubuntu.com,
        pkg-systemd-maintainers@alioth-lists.debian.net,
        systemd-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] Add support for Logilink VG0022A.
Message-ID: <20191115180653.GA6873@Limone>
References: <20191010091848.GA2898@Limone>
 <20191010095103.3803-5-gonsolo@gmail.com>
 <20191010114440.GA7902@Limone>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010114440.GA7902@Limone>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Context: In the upcoming 5.5 kernel there will be (hopefully) support
for the Logilink VG0022A DVB-T2 usb stick. Since this device has a bug a
kernel quirk has been added. An additional quirk is needed for suspend
to work. This is documented here. Hopefully it will be picked up in
distributions or if not, owners of this device can find this
information on the internet.

Standby for this Logilink VG0022A device does not work. I had to
manually unload the module dvb_usb_af9035:

cat /lib/systemd/system-sleep/suspend-modules:

=====

case $1 in
    pre)
        for mod in $(</etc/suspend-modules.conf); do
            rmmod $mod
        done
    ;;
    post)
        for mod in $(</etc/suspend-modules.conf); do
            modprobe $mod
        done
    ;;
esac

=====

cat /etc/suspend-modules.conf:

=====

dvb_usb_af9035

=====

Cheers,
g

