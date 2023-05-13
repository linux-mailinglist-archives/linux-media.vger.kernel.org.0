Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29DB701773
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 15:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbjEMNi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 09:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233685AbjEMNi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 09:38:56 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36BF1736
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:38:55 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-757742c2e5fso667292785a.1
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683985135; x=1686577135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP/xjhOGCEWodxWCKUQcVzDPFWWe6m70q3NDT9usq1c=;
        b=PxM3/4NnM1HGl1zpifqWIlnZMJ5AtYZPMnUwGeWmO4VyQtRRWA21HW9P7MJd4+HwR/
         4tyCnecnDx7UNDMNAz1KfBXP1rsMPdajfqedYAWG1YNSyKHrZOMht4x/S3w+2sn13WED
         I2zq3AsBWJ7K0KLRy5LiVJTIg0aO+x5aNnRnAqPgkq7hEfxn9+ZPAe7mz88sQF8m8Bk7
         wGysaL1v7raipSAq9y3eDfk45AVxwzEhyfV08gSKFBZkO11XEOdbDt+Nn8jKQGIJQgeL
         irRNpm3oVpkLywvT/xki63veHBgyS6io5YdnJz7Q8DmfzadW011GU2GzxEl5odVBmzF5
         Fz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683985135; x=1686577135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP/xjhOGCEWodxWCKUQcVzDPFWWe6m70q3NDT9usq1c=;
        b=d8dqWb0Mvmw51txOhd268qnv2trHHcRFUkDQCb1uiB6kPLmNLh1LetH+QGRuVX6LyG
         zTksJyCmZCEHhyXdOQuvB8XRGP4oiF2Pl5CZIgf4DZsG4tVnUEjMzh2+wpThfWL/3PC+
         6ROdviD6bvSsZ27y/YNbX+3DQeiACLfSOPEktLim6UX7vmJcyVftfVm94GHw/i9X+sUt
         t1MsOVSQ0UyOgHkx3uusZYrxfz3mP8+gHgvQP33FYStopkHEUsPLKWWTu747FCrAwXM6
         t3AmDrRaQ1Yeimn4z4s0Bnql/CT2AOfhOrR04v/vI0Xbbn4xWUdg9f+kzeUR9LQL/x4k
         QPNQ==
X-Gm-Message-State: AC+VfDyFUqp38AwIY1PumEAnNo0qo1loI2Kp5ztwri5OCqxBg0Rl5TNs
        zkOt6Olm3bkFKc2ZGY3HqjJSbYG0E7fNh4srayE=
X-Google-Smtp-Source: ACHHUZ6mrdkS0p/F4N/xrBokQ6SExd+idrDSSHjSbM0JjbqSiw5BMCANG4D+KW+qGUq8ZLcpZWD219dxreihT9TfHUs=
X-Received: by 2002:a05:6214:20ec:b0:621:331b:f55d with SMTP id
 12-20020a05621420ec00b00621331bf55dmr25728307qvk.19.1683985134789; Sat, 13
 May 2023 06:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-7-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-7-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 16:38:18 +0300
Message-ID: <CAHp75VdFzAzbTLQby8rRkg6yoPbA5xy11pH1Mr7c8ExrgBJFmw@mail.gmail.com>
Subject: Re: [PATCH 06/30] media: atomisp: Register only 1 /dev/video# node
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Now that we no longer support continuous mode and thus no longer support
> streaming from 2 /dev/video# nodes at the same time, there is no need
> to have a separate /dev/video# node (+ matching v4l2-subdev pads)
> for each run-mode.

> Keep the video_out_preview /dev/video0 device and remove

> the video_out_video_capture / video_out_video_vf / video_out_capture

video_out_vf I assume.

> video-devices (atomisp_pipe-s) and also remove the matching
> ATOMISP_SUBDEV_PAD_SOURCE_VIDEO / ATOMISP_SUBDEV_PAD_SOURCE_VF /
> ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE source-pads.

--=20
With Best Regards,
Andy Shevchenko
