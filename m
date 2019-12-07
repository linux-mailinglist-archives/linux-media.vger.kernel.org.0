Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689D8115DE6
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 19:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGSWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 13:22:00 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:36203 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfLGSV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Dec 2019 13:21:59 -0500
Received: by mail-pl1-f171.google.com with SMTP id k20so4070124pls.3
        for <linux-media@vger.kernel.org>; Sat, 07 Dec 2019 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rajagiritech-edu-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=rYZBBRiANlnOnFi8ovHE2DcSrsXS2fMjDZoBxr32+zA=;
        b=LG7Q8Mzt++H1r7POjXW1vG6DbiR9S7FNET3iDS1KAXERZ+8citglJyzcXQkNyLneWv
         5kTpn2FaJjjGICZ9n9Gc8K1c7xp+fSYlzglaXGvzNIwjg/LubEtKo1MUD7Id6GqkT3WV
         5ElLslm4TU5iijSUOEhoO0aLC+ZXIg6ej7C4t+v8t7sq0ovx1zMuOOZVGjze/wbGc0Bo
         61WjoZQrVMRt5O5ecSNcsvqnmUQ2ZgxwhnFWwFYVqBg/UbA4oaScGj2UUCn9+hsIhjbs
         rnbsjCxgqZRkhCcz2OU77jC+dFO3Dp8t9Hv7N11D2B2+4mfu99RO2n9f9qpe3yfEeY8g
         7ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=rYZBBRiANlnOnFi8ovHE2DcSrsXS2fMjDZoBxr32+zA=;
        b=KoKKOpXlksgtRKCqi63fY4phIIjV/HOsj3QDxGUZKTaSBd6WLhJxve5BzNVQ7HQxX/
         ej3uZEV7XaYDlWfXcPFAU3qj1irRohuqTSM4iKANWqJQqr11ZMYpFF+bRQhCfd0bhA38
         22V16uzaCT7LYbSRIQf/YzX7UxXv9EX+CupDrHuWuIYyIwKieHXcF5Dzva1dxkgGJypt
         4kFofSXlQATVbhfN6DuyfZQBZMQ4v6Moa3JW6YFn1ujMbNliBoHOZY0lTUiOkyQ0y6us
         xzD/a8uYzVQvdEsEgAyT8sskoV89G0/FTQWvrJbMRgpAqCwsR665Qi/dXRtJsKSV2j38
         pjNg==
X-Gm-Message-State: APjAAAXcv3MD3UhhcYzM+d2RMlDPZhb9in+3ixYKDdw0jweoWeLnqIID
        OzpAEmPR1TwEZv7PV6UFcrTyCvNIxuM=
X-Google-Smtp-Source: APXvYqzlnpKdCEFNMwYy41hXu1QvTa2f2xrCR5pEJOV/WkRY/DzdFlPH7zeB1jU7XQ1eH3uElyOmjA==
X-Received: by 2002:a17:90a:7bc3:: with SMTP id d3mr23367973pjl.86.1575742918122;
        Sat, 07 Dec 2019 10:21:58 -0800 (PST)
Received: from debian ([122.164.203.149])
        by smtp.gmail.com with ESMTPSA id r4sm6993968pji.11.2019.12.07.10.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 10:21:57 -0800 (PST)
Date:   Sat, 7 Dec 2019 23:51:52 +0530
From:   Jeffrin Jose <jeffrin@rajagiritech.edu.in>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PROBLEM] uvcvideo: Failed to query (GET_INFO) UVC control
Message-ID: <20191207182152.GB5280@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hello,

i get this  output piece from "dmesg -l err" of kernel 5.4.2


-------------------x---------------------------x------------------
uvcvideo: Failed to query (GET_INFO) UVC control 6 on unit 1: -32 (exp. 1).
uvcvideo: Failed to query (GET_INFO) UVC control 7 on unit 1: -32 (exp. 1).
-------------------x----------------------------x-----------------

Additional information:
Linux debian 5.4.2 #17 SMP Sat Dec 7 01:39:12 IST 2019 x86_64 GNU/Linux

Relevant file:
drivers/media/usb/uvc/uvc_video.c


--
software engineer
rajagiri school of engineering and technology
