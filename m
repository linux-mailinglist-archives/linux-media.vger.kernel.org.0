Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6366B9AE3
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 01:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407226AbfITXtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 19:49:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33164 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388569AbfITXtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 19:49:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2279AB7D;
        Sat, 21 Sep 2019 01:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569023347;
        bh=/fGfCSuzTJbSxby/HD7S7uc+jChXyFhS9IFmCF0Owpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h/Qg1LlKBUrX7FmAwu1aLrdjC/XPFrEH9BfwSCtiOPbuAq0VvLN6aB0CcBPf6QWL9
         PL0fLbl39D7cwyCF1o960H6CfsM2+DNCA5hMmW595K1jLlpb79/TQ9M0X041dEfB0G
         PvyaeQnyx5RAGf6R9Fq2u3eeEG/FQLy+U5z2KYqI=
Date:   Sat, 21 Sep 2019 02:48:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv4 0/3] v4l2-core: Add metadata type to vfl_devnode_type
Message-ID: <20190920234857.GM12672@pendragon.ideasonboard.com>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Sep 17, 2019 at 03:36:44PM +0200, Hans Verkuil wrote:
> This is a follow-up series from Vandana's "[v3] v4l2-core: Add metadata type to
> vfl_devnode_type" patch: https://patchwork.linuxtv.org/patch/58755/
> 
> While testing that v3 patch with a patched version of vivid that has metadata
> capture support, I realized that metadata should be treated the same way as
> vbi in determine_valid_ioctls(). That makes sense since vbi *is* effectively
> metadata. So I changed Vandana's patch (hence my Co-Developed-by tag) to
> correctly validate the ioctls for metadata.
> 
> I also added two follow-up patches to simplify the SDR code in that function,
> and to fix the code for v4l-touch devices (too many ioctls were enabled for
> such devices). I think the final code is easier to read as well.

Quoting my reply to "[RFC] V4L2 & Metadata: switch to /dev/v4l-metaX
instead of /dev/videoX]" as it may have fell through the cracks, and I
don't want this series to be merged without addressing the issue,

One of the reason [we didn't introduce a metadata video node type] is
CSI-2 sensors and CSI-2 receivers. A CSI-2 link often carries both video
and metadata using two different datatypes. From the point of view of
the CSI-2 receiver or the DMA engines, video and metadata are not
distinguishable, the CSI-2 receiver receives one stream with two data
types, demultiplexes them, and passes them to different DMA engines. A
sensor could send two video datatypes, or even conceptually two metadata
data types, and this would work the exact same way, with each of the two
DMA engines capturing data to buffers without caring about the contents.
Given that the datatype selection happens at runtime, a given DMA engine
is thus not dedicated to video or metadata, any of the DMA engines (and
there could also be more than two) could handle any type of data. For
this type of system we thus can't dedicate device nodes to video or
metadata, they need to support either.

> Hans Verkuil (2):
>   v4l2-dev: simplify the SDR checks
>   v4l2-dev: fix is_tch checks
> 
> Vandana BN (1):
>   v4l2-core: Add metadata type to vfl_devnode_type
> 
>  drivers/media/v4l2-core/v4l2-dev.c   | 97 ++++++++++++++++------------
>  drivers/media/v4l2-core/v4l2-ioctl.c |  5 +-
>  include/media/v4l2-dev.h             |  2 +
>  3 files changed, 61 insertions(+), 43 deletions(-)

-- 
Regards,

Laurent Pinchart
