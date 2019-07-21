Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839416F3B4
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 16:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfGUOcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 10:32:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55744 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfGUOcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 10:32:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C612A281EBE
Message-ID: <6c32193cff92bed7de0a0c070b2325bc8af6611a.camel@collabora.com>
Subject: Re: [PATCH] mx2_emmaprp: use struct v4l2_fh
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Sun, 21 Jul 2019 11:32:09 -0300
In-Reply-To: <53199fac-04b9-027d-e014-041f94565926@xs4all.nl>
References: <53199fac-04b9-027d-e014-041f94565926@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-17 at 15:43 +0200, Hans Verkuil wrote:
> Convert this driver to use struct v4l2_fh and as a result switch to
> using vb2/v4l2_mem2mem helper functions as well.
> 
> Only compile-tested due to lack of hardware. This driver is however
> very similar to the m2m-deinterlace driver in this respect, and that
> v4l2_fh conversion has been properly tested.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

