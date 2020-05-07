Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677AA1C9C44
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 22:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEGUZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 16:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGUZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 16:25:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF4BC05BD43;
        Thu,  7 May 2020 13:25:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so3540101pfw.13;
        Thu, 07 May 2020 13:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zR4F7fu35a4xM+geYfjRvKimT3gifmAlgjrbDWap9yU=;
        b=EEompkec0Snf/CrM9J+xpOo0pxoOZN0hsVzILbgmDs9Yf9Q+RPY31n1iQbZP945QCN
         aoCXIKW38bIokwCldbNar3gmvKJ0FgGQuCGJD+E2Uv53zbK6ZstsVDyL4SdRDeT0pGyh
         uJbWM8OYEqRYnMvOX7+tNLFdbXUZJynY7kXdlrb8DgHLsHiTMx+ySAqI320JOkXDCAK6
         gN1mXkNc75Azm/Z+Pfi2R1/psxlDw3oH5YFdJ2AAfROwweCWMY/wQlvPFV6gPv/b9TS0
         KWVcUdJ1DLQd/Ld0CpJzA/PS96VdbAz6qOKUqPr9g0rpWk+N+LiIxTIsdLgXDlt3o0Zf
         QBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zR4F7fu35a4xM+geYfjRvKimT3gifmAlgjrbDWap9yU=;
        b=pGI7BZkmjQ7BRpj/XbxW4hBwUN/yu/P4c0eKu9u3gxS4BOi7ryS5xfj+4JacbA9q/z
         +Ca50GbJlE5iS8tU2RZv0mBIEAR7SWHy7niEg0tKqp3LpHtjbxxIjAl2TMIz+0xq3HCT
         vn9+RVWsyulqMXQmADU/sP4W2htSZ8mJWuFqdY0/YgFtCLwKle/0kJuLtwaIlFMstaQt
         NFD5mwMtfDTaZhkDoRjMiI9LVdgeXKPbwxQN7JHxumMv0X/Z2zOGHrvR2veEr5vtw61a
         qFdg9HoDszhWW9fAkHg9G3/Ir9PCv+3jtTjiG1MzKaFB7QohvOzmOow3bGQ9NSwA5tyA
         uMWA==
X-Gm-Message-State: AGi0PuajMmIZoFo9Omgw98oLaEL9PhVjCuSn6+j7PzBy/7FYP0ujbmuf
        aJIEU3rH9s8XlDaFdHVEK4/v5ma3
X-Google-Smtp-Source: APiQypJZznZqWgZLFtflkdqRnC/85uMVwJXFyISaljfB2rxvr1SWT6loc+Xh5dpjN5iKp2nzHFmpvg==
X-Received: by 2002:a63:dc41:: with SMTP id f1mr13233836pgj.348.1588883149224;
        Thu, 07 May 2020 13:25:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t14sm4488397pgr.61.2020.05.07.13.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 13:25:48 -0700 (PDT)
Date:   Thu, 7 May 2020 13:25:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200507202546.GM89269@dtor-ws>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507135337.2343-2-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 02:53:36PM +0100, Sean Young wrote:
> serio drivers can only send one byte at a time. If the underlying tty
> is a usb serial port, then each byte will be put into separate usb
> urbs, which is not efficient.
> 
> Additionally, the Infrared Toy device refuses to transmit IR if the
> IR data is sent one byte at a time. IR data is formatted in u16 values,
> and the firmware expects complete u16 values in the packet.
> 
> https://github.com/DangerousPrototypes/USB_IR_Toy/blob/master/Firmware-main/IRs.c#L240

Ummm, serial protocol data size is at most 9 bits so I have no earthly
idea how they expect to get 16.

serio is explicitly byte-oriented layer, of you need to exchange
larger data I'd recommend using USB natively maybe?

Thanks.

-- 
Dmitry
