Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5F41F79D8
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgFLObs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 10:31:48 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:39297 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726085AbgFLObs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 10:31:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id jkiWj7pG1ZgWWjkiZjWPog; Fri, 12 Jun 2020 16:31:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591972306; bh=nCym+V68URqljB+zF0jxDoG5uZ9OAURpMHuY+4kVtNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ek25y6ooiVKrHsLtNoW2msBBEPPbmzkTtVlBE47CV/ciG+iatFdT6vGmuWS0SvSUl
         xx4VUC3/8wTt9TZ+EY6fiFQ82WIEmE6tsyMS9wyh6ef6GKFZLrwY1+M/Jvcq5c0tMv
         ZQQCXgKEpo83ayN9/NIyx4NyS0lESXPd6YEUNM51OgA5JD8FOvOKNo/H0P8zaWdMr4
         aAbBYaKrc7Bg5UhrGi8+v02T/ogLkcA9q/6n3uZONDUeH5fKxtBEdSs3LL5bPXc6vf
         KcSHXv0v1kYVap2GRvhatTGV/rKzC/MgOk9EJS+o/HVhQQPb2Rt3M8rQS/qZp/Dc4K
         6KcjRzJbA/lQw==
Subject: Re: [RESEND PATCH v3 0/6] media: staging: rkisp1: bugs fixes and vars
 renames
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200611154551.25022-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2f0f7297-6067-9af0-c544-fc7defad943d@xs4all.nl>
Date:   Fri, 12 Jun 2020 16:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200611154551.25022-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGmSocrPpAgHoUy6j0hE9l1Ucx0Lv4acvA1yIyIkDkq0MbHONKkz/0iOqaoMHY1142snEcuQGdyLW+1L02uMnPN+/5ecD/x8fIG4q1cmzYiJ8frhEiBo
 Mhcoi6iY0CDU6hDEc9ADh32WYf8DcRQnD0VDIcmD1cfItpYaUw+CDdITL3PZKPzPZIts2ABlmuNoSIHBnILYr0GJjO/6Uj6Iagg7F6FjCFlfldoTWczNVrtr
 Jyg4SZybRevmK3yjQotSpXSIYNY40CEBVmCzsG/c0Apl5w6y9LzuZ6nzfcRDps6w7Ad5h+9pitHpq0UAt+a3IuN3TmYhMWB9DafeJ06vpEQy1j+KAV5xl0L7
 8KEwGfasgaZXpx1yKBUsoI9lpqJROqdr1JkRRKOt7mHwf9Q2xNzBg77s5wM4sNRLpsP/XmfZSxr3i8YhcecmKO+FTYHEbdGewrZr3ULKICPA3VV/3bBFCOGU
 efR+lrgfth1aK0TK9uyfB0WmKzrWFM/AWB7KWBz8RFjS6Lspz6+fNpqbm0sBwzG1sVs1Dkm7hoELFitY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(dropped the CC to stable)

Dafna,

Can you repost this an another RESEND, but without the CC to stable?

That will make it easier to review otherwise any reply would go to stable
as well and just annoy Greg :-)

If you need patches to go to stable, then add a Cc: line to stable after your
Signed-off-by tag. When the patch is merged into the mainline kernel it will
be automatically Cc-ed to stable.

Regards,

	Hans

On 11/06/2020 17:45, Dafna Hirschfeld wrote:
> RESEND the patchset because I forgot to add the first two patches
> to the set
> 
> The first two patches in this patchset are two bug fixes related to the enumeration and
> settings of the sink format of the resizer entity.
> The next 3 patches are renaming/removing macros and variables.
> patch 6 adds documentation to the struct rkisp1_isp_mbus_info
> 
> changes from v2:
> - patch 3 is new - remove macro RKISP1_DIR_SINK_SRC since the code is more readable without it.
> - patch 5 - rename 'direction' to 'isp_pads_mask' instead of 'isp_pads_flags'
> - patch 6 is new - add documentation of the struct 'rkisp1_isp_mbus_info'
> 
> changes from v1:
> - added "Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
> to the commit log of the first two patches.
> - added two patches. One patch rename the macros "RKISP1_DIR_*"
> to "RKISP1_ISP_SD_*", another that rename the field 'direction'
> in 'struct rkisp1_isp_mbus_info' to 'isp_pads_flags'
> 
> Dafna Hirschfeld (6):
>   media: staging: rkisp1: rsz: supported formats are the isp's src
>     formats, not sink formats
>   media: staging: rkisp1: rsz: set default format if the given format is
>     not RKISP1_DIR_SRC
>   media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
>   media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to
>     'RKISP1_ISP_SD_*'
>   media: staging: rkisp1: rename the field 'direction' in
>     'rkisp1_isp_mbus_info' to 'isp_pads_mask'
>   media: staging: rkisp1: common: add documentation for struct
>     rkisp1_isp_mbus_info
> 
>  drivers/staging/media/rkisp1/rkisp1-common.h  | 18 ++++++-
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 50 +++++++++----------
>  drivers/staging/media/rkisp1/rkisp1-resizer.c |  6 +--
>  3 files changed, 43 insertions(+), 31 deletions(-)
> 

