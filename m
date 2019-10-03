Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDB4CA051
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbfJCO33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:29:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34938 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJCO33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 10:29:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so3023968lji.2;
        Thu, 03 Oct 2019 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pPX6hZuTAKscoMR2pVUc6O2c3J5blh2oSncwZUdgBs0=;
        b=QNx2/2uEq3OIs68G+c7YaycV7Fq+Ty/tmEsjmJN2O1wK/L20mVZIg0TgD0Vn3YJDiU
         44bumczvzhdkqZxYEV+Wyi37+06A8HeOnIcCFakx2Hi1/YEiHklQ2hQLtPqeHx5eNU6E
         EDcU7okyDqkMBR7RycSpw2Dt5H/qjbL0qmzyXkybR+T4SOMn3cpb7SlqkPMqmKX+2wTM
         gGnWt/PhrMniousn5W2B73m4sVahsXS/JGg9lLt5TegpnytwEmbboAvkZa02rvfgPslD
         5wN/h5ZOt1fYdJuWgpEk5vhPx6WL2PGhmqbO1Sl6/rtyhDXsxn1tez9+/Ev+6IcD5GhO
         YN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pPX6hZuTAKscoMR2pVUc6O2c3J5blh2oSncwZUdgBs0=;
        b=Lc1BNJf0n6t6XOWg7zNXfdp9SGz4moSG5d3DNVSVsNzed9Pcayp0TEV/WuYZ86KYM2
         6HxxsgXNR5GINhg1l04fU+VA3CCHAXdnJTVGYtZwqFkrePRHVSEyQDGyMwGOjnAQYx74
         9F1VXP62ou2rypi/GaPvXP5uWeC1GvxiAweGxUZyVK/iAomYD5mYhK0fXpd3QLuasegC
         t70GeAhHM/Pg2F+YljUXreeDSYd8jxGiWLOrP8K1SlkUamWMlK5zuiE2jdpRsk5nvdA3
         JlC5M8tYOEWs0nNnoVqJawm+YXLtg93A34bKh3lv+A9JbgISi8BXcsW/xTtIXI08fLjL
         v0WA==
X-Gm-Message-State: APjAAAUXgkFmscF7oOdlGX7Ntv8vBfAB6ufy0fEcjaNUTWEYQVNMWJ6U
        vG9xyb6xfaZjEf2UUQP5+DRQOpuWmCJJfIiuLIQ=
X-Google-Smtp-Source: APXvYqzrcxzFW/+/EqjTje5qh9q51U5wuUGgGdtKJsVPYwQHr3s96kYVhvW2iDIi5EcJCY8ThfZEOB8n0in7gNpCt0U=
X-Received: by 2002:a2e:7d0d:: with SMTP id y13mr6366997ljc.170.1570112966775;
 Thu, 03 Oct 2019 07:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
 <20191003081742.0933264b@coco.lan> <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
 <20191003094904.3aa5fdc7@coco.lan> <20191003095237.2efa0e7f@coco.lan>
 <20191003130224.GA2596@Limone> <CANL0fFQR4KDU5PKeedK6wF45nSTu6dUyz_MBwmP1QsJxYQAWNg@mail.gmail.com>
 <20191003110551.19f06922@coco.lan>
In-Reply-To: <20191003110551.19f06922@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 16:29:15 +0200
Message-ID: <CANL0fFSPxJO597qyt9SgYaqAPxkP4P-R1ZuvdmOtav9KEX5qsQ@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Try to reduce the bus speed to 10kbps

Nope:

#define I2C_SPEED_REGISTER 260  // ~10k

[  117.860961] si2168 1-0067: downloading firmware from file
'dvb-demod-si2168-b40-01.fw'
[  118.958355] si2168 1-0067: firmware version: B 4.0.25
[  118.968882] si2157 2-0063: Bogus chip version, trying with new firmware
[  118.968888] si2157 2-0063: found a 'Silicon Labs Si21255-\xff\xff\xff'
[  118.972005] si2157 2-0063: downloading firmware from file
'dvb-tuner-si2157-a30-01.fw'
[  121.154130] si2157 2-0063: rebooting tuner...
[  121.169626] si2157 2-0063: querying firmware version...
[  121.172799] si2157 2-0063: firmware version: \xff.\xff.255
[  121.172803] si2157 2-0063: querying chip revision...
[  121.175911] si2157 2-0063: chip revision: 255.255.255.255

g



-- 
g
