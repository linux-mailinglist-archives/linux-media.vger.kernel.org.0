Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056A870DF1D
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 16:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236991AbjEWOW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 10:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjEWOW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 10:22:27 -0400
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482E0DD
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 07:22:17 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2af2db78b38so43109251fa.3
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1684851675; x=1687443675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VHnbF/PTLJ+OV/uzaJR0gZmQeVRliEOgO7DoYSB+ab0=;
        b=JSN8wTGO8J4qTl0egySoIZ6TgK1WbD784K9KI3x1/TtwpF1mN6kMFm4PSgnjUj58RE
         R5mJqbMb69vMNC2CRWqI/MGY5BIHJvMqCkfFOkCXq2YANUSU6sdol1Um43Xs9pWQPUPk
         mQ0MAbJkf/ys2b9MStNtG+0uD77JNEUzn0JjoQZMiOGV42EN8AqhQa2PeqIU2Se1hnPa
         mDgZI6dbK6JUYOIjB3rTd6CO3ftfouSjgXbYgliie10q1nLJ8U4ra4Oa2CLHuY9oDrNR
         eqyb9id73CdieCCPOBkIodckYg0Z1VA4ad0HwVXtIFoNDJZKdMxDAbwnAgSkH+Fb44D1
         ekgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684851675; x=1687443675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHnbF/PTLJ+OV/uzaJR0gZmQeVRliEOgO7DoYSB+ab0=;
        b=jX/1P8TS5bbNsIi+J9OwzvzL9uFymSB+qTjJ85v0Xr2J46nvVkSsTrGnI7hIzJemQK
         Iaya+D68rjbuIUU1gZvm78zg0xfdTQICaG407HQ7Kivep2JmpZe8hn9f2KAYBEKDGsyr
         mymZEuwLMxLm0lwQGW1gr72Ru5qy/stpS1CvBvX0Uvd1RXBrDYiFLJcGNbC/s4ib0BAE
         Ac6+LoIU3+qInSrx7UxBO43T5eXx94coZbUQoiWCwmZ6RDJlvzmt+a+fza8h1qcE6Gqa
         CdP4MpGfZ3KcDWMAwy0wa+bWyn6PfVeJpGUeoNyZAOpZRDAKX12mPBT1f4XkJXZsYU4s
         057Q==
X-Gm-Message-State: AC+VfDw8PjUnzMw/0JVc7HvixjCGX0dvkpFZagnBAnCiZQPk+Nm/KETm
        q0wXt9fh7FEbejoW07g2zHf8iF2N5SrndmzoGrc=
X-Google-Smtp-Source: ACHHUZ7FN3mdbe0EkSUgeiZwkvpxVCy1spYrMxil8ibSMhbivpfTU2DliU1c/hqfg9qeM7V4B8yDUg==
X-Received: by 2002:a2e:9a94:0:b0:2a7:6f82:4a87 with SMTP id p20-20020a2e9a94000000b002a76f824a87mr5088997lji.35.1684851675606;
        Tue, 23 May 2023 07:21:15 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id y18-20020a05651c021200b002ab5ad42f3fsm1641107ljn.92.2023.05.23.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:21:14 -0700 (PDT)
Date:   Tue, 23 May 2023 16:21:13 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media Summit June 26th: Please let me know if you will
 attend
Message-ID: <ZGzL2WJtrE4rx2wQ@oden.dyn.berto.se>
References: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for organizing this.

On 2023-05-15 16:34:20 +0200, Hans Verkuil wrote:
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

I would like to attend in person.

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

-- 
Kind Regards,
Niklas Söderlund
