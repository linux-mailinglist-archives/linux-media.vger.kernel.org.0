Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461637126D4
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 14:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbjEZMjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 08:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjEZMjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 08:39:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EBE9E
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 05:39:02 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-510b4e488e4so1132793a12.3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685104741; x=1687696741;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GoudHZlMmHOBkEuNNFzfbcFKzOUP+KGL9yOg3jQ33XA=;
        b=VDPK7zIXvlBIp9VbOXmsumdf0LBhvA1OtsmZcaDVTpbMGdCAUi5H+jwnMgAMenuK4R
         ApZjAeyDcvL+0vom0AZkrHYq2uDmAwmMO/gV3LbEbJ9b542Bs9xXEVN24f6Ssckn0JDx
         3KPnj9DEyI2OnOABY+iMjfQCemdgAhYipASfqQd1c/zNhxlkdKnQi36O4HkPIFHEvsqz
         mgRNbDzKP8MeglPI90vEC93IQb5PcAwpUGt/sKOMJj27sFPiHoENW6o92NezueOhQ9bQ
         sSDu9AazW/K8XbQ3CnKAiQ1JfUYCRbalz9R9racNEzxTWKEy+WbtF7yYmO4Re26vhass
         RO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685104741; x=1687696741;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoudHZlMmHOBkEuNNFzfbcFKzOUP+KGL9yOg3jQ33XA=;
        b=YIgvjKycYSoJpC5rNPcYbiUzxJU3udSUyF3WBV0bGiUznXgIrUPk3dQWyrTtGa9lCJ
         b6NspusBL7zI2CIarXlNwFzBAAsCg9cvB18VaNTPXlR6joYq9p+8MJBjxGWklG8SVuan
         q6gZbQLG5OMi57ekor0vYfzqN1cBb/wTmqY22q0r9G1w4P3O8nh45jOHsbAms07cZON2
         1S7JSoi4rrzyJxYbJCk9S0gagXHe2AItllvKIxPilN/UZuJbJY79Wh4DYjCfueydvFUm
         UxhSts7FaUwZmwiW4gL6DLDumtsz/csOuu+JVQ+JQZPaL6IFQpvYuOfenea2dl9M+wWb
         Gd3Q==
X-Gm-Message-State: AC+VfDxI3QmRVjR17b+2acI9HPETFrgnSXL/zxgcs24B6vd9xtn7ZDI9
        uDIlGqVlAjWa0/QCz6+9tU1fg7vS83U+6w==
X-Google-Smtp-Source: ACHHUZ5UsPwp1ni4OwuOKfoxhrMwJn+s1T8G22O1bjX7F5cEW7vbnnffj5SWpsQOIuM9mBnIS2+V1A==
X-Received: by 2002:aa7:d9cc:0:b0:509:c6e6:c002 with SMTP id v12-20020aa7d9cc000000b00509c6e6c002mr933703eds.39.1685104740604;
        Fri, 26 May 2023 05:39:00 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-121.cust.vodafonedsl.it. [188.217.50.121])
        by smtp.gmail.com with ESMTPSA id u8-20020a05640207c800b0050a276e7ba8sm1499706edy.36.2023.05.26.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 05:39:00 -0700 (PDT)
Date:   Fri, 26 May 2023 14:38:58 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Martin Hecht <martin.hecht@avnet.eu>,
        Michael Roeder <michael.roeder@avnet.eu>
Subject: Re: [ANN] Media Summit June 26th: Please let me know if you will
 attend
Message-ID: <ZHCoYqlctSsqSUHE@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Mon, May 15, 2023 at 04:34:20PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> We organized a Media Summit on Monday June 26th in Prague. It is held
> at the Holiday Inn close by the conference centre where the Embedded
> Open Source Summit is held (1).
> 
> Holiday Inn Prague Congress Centre - Meeting room "E"
> Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
> 
> We have room for about 20 people, so let me know if you plan to attend
> in person. That way we know how many people we'll get.

Thanks for your effort on support/create this event.

I don't have particular topics. I would like to attend in person too, if possible.
In real we are me and other 2 guys that are in cc (Martin Hecht and Michael Roeder).

Let me know if can be possible for us to partecipate at this event.
Many thanks! :)

Regards,
Tommaso

> 
> Regarding remote participation: only if there is really no other way.
> Meeting face-to-face once a year is important IMHO, and attending remotely
> is a poor substitute. That said, if it is really necessary to set something
> up, then I can do the same I did in Dublin, setting up a Webex meeting.
> That worked reasonably well, except that I will need to bring a better
> speaker since I learned that the laptop speaker was pretty bad.
> 
> If you do want to participate remotely, please let me know as well.
> 
> I'll post a separate email with the draft Agenda for the media summit.
> 
> Hope to see you all in Prague!
> 
> Regards,
> 
> 	Hans
> 
> (1) https://events.linuxfoundation.org/embedded-open-source-summit/
