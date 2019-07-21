Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC756F3B3
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 16:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfGUOcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 10:32:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55726 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfGUOcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 10:32:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 632BE281EBE
Message-ID: <5e7147fbd1a342419f39b666e8806bd3f80cf986.camel@collabora.com>
Subject: Re: [PATCH 5/6] omap_vout: use struct v4l2_fh
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Sun, 21 Jul 2019 11:31:52 -0300
In-Reply-To: <26e4e34d-c148-271d-be13-77fc8d15a646@xs4all.nl>
References: <26e4e34d-c148-271d-be13-77fc8d15a646@xs4all.nl>
Organization: Collabora
X-Priority: 1
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-17 at 15:29 +0200, Hans Verkuil wrote:
> This driver is one of the few that is still not using struct
> v4l2_fh. Convert it.
> 
> Tested on a Pandaboard.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

