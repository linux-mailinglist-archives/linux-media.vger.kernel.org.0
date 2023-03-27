Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC226CAD04
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 20:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjC0S2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 14:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjC0S2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 14:28:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196D64200
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 11:28:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D8D4B818BC
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 18:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBAAC4339B;
        Mon, 27 Mar 2023 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679941715;
        bh=HpnRQKMV4N7xO+MCX4+Ry14MDDqkj8sStFclhUZ9b+U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JuhLu44V47oaiz8v6waJrw0DMP9pyOWH8rRyes7dvbsTJhEi26OsO9SGdHpd7QxQo
         JY4rYaWvyazPYuOdScH23VEhZ/iR+Ux5eGd+z1dW3XFpdP+jM8Zos3YuPMroPLcP3Y
         y4ISrJD1NO/H/NUcE+M/IK4zN98bBdqu8pFyMBD1ynd5GzB1/tYS6Bsik+W/uEQoek
         ubPcrSy0ikX2+aIWHw7cepwKuEe9HDobXEg/PATk2HTuHGOz8nV6mlZrX3bxu1s3we
         8RRD0SgvYhZd+z5R8QiklABsSOmxp0wcQIyNT8JXuEVorGh9IEpwNeRQF1oWkznZk2
         Kuq+SnVNu72bw==
Date:   Mon, 27 Mar 2023 19:28:26 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stefan Herdler <herdler@nurfuerspam.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: Re: [PATCH v2] Legacy DVB API: completion of documentation
Message-ID: <20230327192826.65ae299d@sal.lan>
In-Reply-To: <decd5d71-f06e-5873-5ebf-7028107f65ee@nurfuerspam.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
        <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
        <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
        <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
        <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
        <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
        <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
        <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
        <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
        <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
        <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
        <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
        <20230208100847.3ec87576@coco.lan>
        <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
        <50f69514-abbb-2dfb-6060-889aa2c6e02c@nurfuerspam.de>
        <decd5d71-f06e-5873-5ebf-7028107f65ee@nurfuerspam.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 26 Mar 2023 23:34:16 +0200
Stefan Herdler <herdler@nurfuerspam.de> escreveu:

> On 25/03/23 02:44, Stefan Herdler wrote:
> > Hi Mauro and Hans,
> >
> > it took a little longer then anticipated, but I think I was able to fil=
l the gaps in the documentation.

Hmm.. your e-mailer seems to have mangled it:

	patch -p1 -i /tmp/dvb-doc.patch=20
	patching file Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
	patching file '=3D'
	patch: **** malformed patch at line 198: , which

Better to submit it via "git send-email".

> > At least everything in the header-files is in the documentation now. I =
hope, I have done it sufficiently.

Good! It took me quite a while to read everything... At the end, as was
a little tired, so I probably missed things.

Next time, please split this on a patch series, in order to make
easier for the poor reviewers to look into it ;-)

> >
> > Some remarks:
> >
> > I considered the existing documentation to be trustworthy.

Please don't do that. The existing ones came from an old DVB API=20
documentation, plus some reverse engineering we did to try to
understand missing bits.

There are existing gaps there that we were not able to address
(including some ioctls that has only a doc stub, if I'm not=20
mistaken - I guess we removed some of those, but maybe there are
some stubs remaining somewhere).

> > Existing things like returntypes, errnos, ... haven't been touched by m=
e.

Well, errnos are probably not too outdated.

> > There are only a few minor modifications to reflect the data formats ac=
tually used for playback.

Ok.

> >
> > The documentation has been merged into one file per header-file. Entrie=
s have been sorted equally.
> > For me it is much better arranged this way, the mass of different files=
 where just to confusing and the
> > original files have already been removed anyway.
> > But I may revert that if necessary.

No need to revert.

> >
> > Title and chapter-styles has been changed to the suggested ones in "/do=
c-guide/sphinx.html#writing-documentation".
> >
> > There are still some "Duplicate C++ declaration, ..." warnings. Renamin=
g doesn't work either: 'unknown option: "name"'

Don't care about that. There's a known bug on Sphinx related to it since
version 3.x (present at least until at least version 5). Basically, if
a struct has the same name of a function, for instance, it will generate
warnings.

> > I haven't found any useful hint how to get rid of them.
> > Should I switch to "code-block:: c" instead?
> > But there are a lot of this warnings from other files too. It seems I'm=
 mot the only one with this problem. =20
> I switched to "code-block".
> Now there are no warnings anymore.

For things like ioctl, code-blocks are preferred. For other things,
better to keep the warnings and not use code-block where not needed. The
warnings are part of the Sphinx cross-reference system, which tries to
create references to the C domain functions and data types.

Unfortunately, Sphinx has a known bug that it is hit when the same symbol
name is used with different meanings e.g., on C declarations like those:

	struct foo;
	enum foo;
	typedef foo;
	foo() {}

Each one has a different type. So, `foo` cross-references depend on
the context. Right now, Sphinx will just consider them to be attempts
to re-define an existing name. There's already patches fixing it
Sphinx upstream, but (last time I checked) not applied yet as those
would cause regressions on intersphinx.

> This functions shouldn't be referenced from outside this document anyway.

No, we link the header files with the documentation, exactly to
generate cross-references and detect gaps at the docs.

> Lets hope, the robot likes it better this way :-).
>=20
> Regards
> Stefan
>=20
> >
> >
> > Please point out, if something is missing, wrong or need to be improved=
. I will try to fix it.
> >
> > Regards
> > Stefan
> >
> > p.s. It is my first try to submit a patch this way. I hope my mail-clie=
nt doesn't mess it up.
> > =20
>=20
>=20
> This patch is largely based on the already existing documentation and the=
 header files
>=20
>=20
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303251637.x35nzuXi-lkp@i=
ntel.com/
>=20
>=20
> Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
>=20
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst b/=
Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
> index b97d56ee543c..ffe8325749e5 100644
> --- a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
> @@ -23,3 +23,4 @@ DVB-S2, DVB-T2, ISDB, etc.
>      :maxdepth: 1
>=20
>      frontend_legacy_dvbv3_api
> +    legacy_dvb_decoder_api
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b=
/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> new file mode 100644
> index 000000000000..b4f75643c21f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> @@ -0,0 +1,1280 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later

Please place it dual licensed with GFDL and GPL 2.0.

> +
> +.. _dvb_audio:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DVB Audio Device
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +The DVB audio device controls the MPEG2 audio decoder of the DVB
> +hardware. It can be accessed through ``/dev/dvb/adapter?/audio?``. Data
> +types and ioctl definitions can be accessed by including
> +``linux/dvb/audio.h`` in your application.
> +
> +Please note that most DVB cards don=E2=80=99t have their own MPEG decode=
r, which
> +results in the omission of the audio and video device.
> +
> +These ioctls were also used by V4L2 to control MPEG decoders implemented
> +in V4L2. The use of these ioctls for that purpose has been made obsolete
> +and proper V4L2 ioctls or controls have been created to replace that
> +functionality. Use :ref:`V4L2 ioctls<video>` for new drivers!
> +
> +
> +
> +Audio Data Types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This section describes the structures, data types and defines used when
> +talking to the audio device.
> +
> +
> +
> +audio_stream_source_t
> +---------------------
> +
> +The audio stream source is set through the `AUDIO_SELECT_SOURCE`_ call
> +and can take the following values, depending on whether we are replaying
> +from an internal (demux) or external (user write) source.
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	AUDIO_SOURCE_DEMUX,
> +	AUDIO_SOURCE_MEMORY
> +    } audio_stream_source_t;
> +
> +AUDIO_SOURCE_DEMUX selects the demultiplexer (fed either by the
> +frontend or the DVR device) as the source of the video stream. If
> +AUDIO_SOURCE_MEMORY is selected the stream comes from the application
> +through the `write()`_ system call.
> +
> +
> +audio_play_state_t
> +------------------
> +
> +The following values can be returned by the `AUDIO_GET_STATUS`_ call
> +representing the state of audio playback.
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	AUDIO_STOPPED,
> +	AUDIO_PLAYING,
> +	AUDIO_PAUSED
> +    } audio_play_state_t;

Those are kind of obvious, but still the best would be to have documentation
for all enums/typedefs.=20

> +
> +
> +audio_channel_select_t
> +----------------------
> +
> +The audio channel selected via `AUDIO_CHANNEL_SELECT`_ is determined by
> +the following values.
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	AUDIO_STEREO,
> +	AUDIO_MONO_LEFT,
> +	AUDIO_MONO_RIGHT,
> +	AUDIO_MONO,
> +	AUDIO_STEREO_SWAPPED
> +    } audio_channel_select_t;

Here too.=20

> +
> +
> +audio_mixer
> +-----------
> +
> +The following structure is used by the `AUDIO_SET_MIXER`_ call to set the
> +audio volume.
> +
> +
> +.. code-block:: c
> +
> +    typedef struct audio_mixer {
> +	unsigned int volume_left;
> +	unsigned int volume_right;
> +    } audio_mixer_t;

And here. In special, what are the maximum values for the volume?

> +
> +
> +audio_status
> +------------
> +
> +The `AUDIO_GET_STATUS`_ call returns the following structure informing
> +about various states of the playback operation.
> +
> +
> +.. code-block:: c
> +
> +    typedef struct audio_status {
> +	boolean AV_sync_state;
> +	boolean mute_state;
> +	audio_play_state_t play_state;
> +	audio_stream_source_t stream_source;
> +	audio_channel_select_t channel_select;
> +	boolean bypass_mode;
> +	audio_mixer_t mixer_state;
> +    } audio_status_t;

Each field should be described.

> +
> +
> +audio encodings
> +---------------
> +
> +A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
> +following bits set according to the hardwares capabilities.
> +
> +
> +.. code-block:: c
> +
> +     #define AUDIO_CAP_DTS    1
> +     #define AUDIO_CAP_LPCM   2
> +     #define AUDIO_CAP_MP1    4
> +     #define AUDIO_CAP_MP2    8
> +     #define AUDIO_CAP_MP3   16
> +     #define AUDIO_CAP_AAC   32
> +     #define AUDIO_CAP_OGG   64
> +     #define AUDIO_CAP_SDDS 128
> +     #define AUDIO_CAP_AC3  256

Same here. This is probably not too hard, as they seems to belong
to some old DVB spec (there are more audio standards added on
newer versions of ETSI specs).

> +CEC_ADAP_G_CONNECTOR_INFO

Huh? Cut and paste issue?


> +
> +Audio Function Calls
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +AUDIO_STOP
> +----------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_STOP)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_STOP for this command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to stop playing the current
> +stream.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_PLAY
> +----------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_PLAY)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_PLAY for this command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to start playing an audio stream
> +from the selected source.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_PAUSE
> +-----------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_PAUSE)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.

Cross references to syscalls are hard, as each filesystem has its
own definition. On DVB, each subset of the API also has it ;-)

We need to place them inside a namespace in order for the cross
references to point to the right ones.

See, for instance c:namespace:: DTV.ca and other similar definitions.

Without that, you'll be generating duplicated symbols and broken
cross references.

> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_PAUSE for this command.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call suspends the audio stream being played. Decoding and
> +playing are paused. It is then possible to restart again decoding and
> +playing process of the audio stream using `AUDIO_CONTINUE`_ command.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_CONTINUE
> +--------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_CONTINUE)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_CONTINUE for this command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl restarts the decoding and playing process previously paused
> +with `AUDIO_PAUSE`_ command.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SELECT_SOURCE
> +-------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_SELECT_SOURCE, audio_stream_so=
urce_t source)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SELECT_SOURCE for this command.
> +
> +    -  .. row 3
> +
> +       -  `audio_stream_source_t`_ source
> +
> +       -  Indicates the source that shall be used for the Audio stream.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call informs the audio device which source shall be used for
> +the input data. The possible sources are demux or memory. If
> +AUDIO_SOURCE_MEMORY is selected, the data is fed to the Audio Device
> +through the write command.

Please also describe AUDIO_SOURCE_DEMUX.

FYI, this is one of the problems with this API, there are just two
possibilities there: AUDIO_SOURCE_DEMUX or AUDIO_SOURCE_MEMORY. This
doesn't work on devices that have multiple demuxes and multiple
tuners.

See, this API is interesting for embedded hardware which are the
ones that may actually have audio and video decoders those days.
However, they all offer multiple possibilities to setup audio and
video pipelines.

> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SET_MUTE
> +--------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_SET_MUTE, boolean state)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SET_MUTE for this command.
> +
> +    -  .. row 3
> +
> +       -  boolean state
> +
> +       -  Indicates if audio device shall mute or not.

Please be clearer what 0 indicates and what other values
indicate (Kernel receives an integer for ioctl arguments, and not a
boolean, so internally is not really a boolean). From av7110:

	case AUDIO_SET_MUTE:
        {
                ret =3D audcom(av7110, arg ? AUDIO_CMD_MUTE : AUDIO_CMD_UNM=
UTE);
                if (!ret)
                        av7110->audiostate.mute_state =3D (int) arg;
                break;
        }

0 means unmuted. Any other value means muted.

> +
> +    -  .. row 4
> +
> +       -
> +       -  TRUE Audio Mute
> +
> +    -  .. row 5
> +
> +       -
> +       -  FALSE Audio Un-mute

There are just 3 arguments, and not 5 ones ;-)

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for DVB devices only. To control a V4L2 decoder use the
> +V4L2 :ref:`VIDIOC_DECODER_CMD` with the
> +``V4L2_DEC_CMD_START_MUTE_AUDIO`` flag instead.
> +
> +This ioctl call asks the audio device to mute the stream that is
> +currently being played.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SET_AV_SYNC
> +-----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_SET_AV_SYNC, boolean state)
> +
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_AV_SYNC for this command.
> +
> +    -  .. row 3
> +
> +       -  boolean state
> +
> +       -  Tells the DVB subsystem if A/V synchronization shall be ON or =
OFF.
> +
> +    -  .. row 4
> +
> +       -
> +       -  TRUE AV-sync ON
> +
> +    -  .. row 5
> +
> +       -
> +       -  FALSE AV-sync OFF

Same here (and on other booleans): use 3 rows, and at the "boolean"
explains what zero means and what non-zero means.

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to turn ON or OFF A/V
> +synchronization.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SET_BYPASS_MODE
> +---------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_SET_BYPASS_MODE, boolean mode)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SET_BYPASS_MODE for this command.
> +
> +    -  .. row 3
> +
> +       -  boolean mode
> +
> +       -  Enables or disables the decoding of the current Audio stream in
> +	  the DVB subsystem.
> +
> +    -  .. row 4
> +
> +       -
> +       -  TRUE Bypass is disabled
> +
> +    -  .. row 5
> +
> +       -
> +       -  FALSE Bypass is enabled
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to bypass the Audio decoder and
> +forward the stream without decoding. This mode shall be used if streams
> +that can=E2=80=99t be handled by the DVB system shall be decoded. Dolby
> +DigitalTM streams are automatically forwarded by the DVB subsystem if
> +the hardware can handle it.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_CHANNEL_SELECT
> +--------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_CHANNEL_SELECT, audio_channel_=
select_t)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_CHANNEL_SELECT for this command.
> +
> +    -  .. row 3
> +
> +       -  `audio_channel_select_t`_ ch
> +
> +       -  Select the output format of the audio (mono left/right, stereo=
).
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for DVB devices only. To control a V4L2 decoder use the
> +V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK`` control instead.
> +
> +This ioctl call asks the Audio Device to select the requested channel if
> +possible.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_GET_STATUS
> +----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_GET_STATUS, struct audio_statu=
s *status)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_GET_STATUS for this command.
> +
> +    -  .. row 3
> +
> +       -  struct `audio_status`_ \*status
> +
> +       -  Returns the current state of Audio Device.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to return the current state of the
> +Audio Device.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_GET_CAPABILITIES
> +----------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_GET_CAPABILITIES, unsigned int=
 *cap)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_GET_CAPABILITIES for this command.
> +
> +    -  .. row 3
> +
> +       -  unsigned int \*cap
> +
> +       -  Returns a bit array of supported sound formats.
> +          Bits are defined in `audio encodings`_.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to tell us about the decoding
> +capabilities of the audio hardware.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_CLEAR_BUFFER
> +------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_CLEAR_BUFFER)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_CLEAR_BUFFER for this command.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Audio Device to clear all software and hardware
> +buffers of the audio decoder device.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SET_ID
> +------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(int fd, int request =3D AUDIO_SET_ID, int id)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SET_ID for this command.
> +
> +    -  .. row 3
> +
> +       -  int id
> +
> +       -  audio sub-stream id
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl selects which sub-stream is to be decoded if a program or
> +system stream is sent to the video device. If no audio stream type is
> +set the id has to be in [0xC0,0xDF] for MPEG sound, in [0x80,0x87] for
> +AC3 and in [0xA0,0xA7] for LPCM. More specifications may follow for
> +other stream types. If the stream type is set the id just specifies the
> +substream id of the audio stream and only the first 5 bits are
> +recognized.

Hmm... "More specifications may follow for other stream types". What do
you mean?

As this API is legacy, and supports only a limited set of standards,
I would place here the valid values for the av7110 driver.

"First 5 bits" is vage. Are the 5 LSB bytes? the 5 MSB bytes?

Also, is it big endian, little endian or cpu's endian?

Btw, this doesn't seem to be used on av7110. Now, I don't mind having it
documented there if used by some other OOT driver, provided that it=20
defines a clear API - e. g. what is the bit order and valid values
(it could be a pointer to ETSI docs in case you don't want to define
everything).

> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +AUDIO_SET_MIXER
> +---------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_SET_MIXER, audio_mixer_t *mix)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SET_ID for this command.

Huh? I guess you meant AUDIO_SET_MIXER.

> +
> +    -  .. row 3
> +
> +       -  audio_mixer_t \*mix
> +
> +       -  mixer settings.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl lets you adjust the mixer settings of the audio decoder.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +
> +AUDIO_SET_STREAMTYPE
> +--------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  ioctl(fd, int request =3D AUDIO_SET_STREAMTYPE, int type)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_SET_STREAMTYPE for this command.
> +
> +    -  .. row 3
> +
> +       -  int type
> +
> +       -  stream type

What's the meaning of type?

Btw, av7110 doesn't seem to be using it.

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl tells the driver which kind of audio stream to expect. This
> +is useful if the stream offers several audio sub-streams like LPCM and
> +AC3.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EINVAL``
> +
> +       -  type is not a valid or supported stream type.
> +
> +
> +
> +AUDIO_BILINGUAL_CHANNEL_SELECT
> +------------------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int ioctl(int fd, int request =3D AUDIO_BILINGUAL_CHANNEL_SELECT, audi=
o_channel_select_t)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals AUDIO_BILINGUAL_CHANNEL_SELECT for this command.
> +
> +    -  .. row 3
> +
> +       -  audio_channel_select_t ch
> +
> +       -  Select the output format of the audio (mono left/right, stereo=
).

IMO, this is also another problematic API. Its name seems to be related
to language selection. However, multi-language usually uses different
PIDs. Maybe in the past they used to place two languages at the same
PID, one at the left channel and the other at the right one?

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl has been replaced by the V4L2
> +``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
> +for MPEG decoders controlled through V4L2.
> +
> +This ioctl call asks the Audio Device to select the requested channel
> +for bilingual streams if possible.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +
> +open()
> +------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  open(const char *deviceName, int flags)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  const char \*deviceName
> +
> +       -  Name of specific audio device.
> +
> +    -  .. row 2
> +
> +       -  int flags
> +
> +       -  A bit-wise OR of the following flags:
> +
> +    -  .. row 3
> +
> +       -
> +       -  O_RDONLY read-only access
> +
> +    -  .. row 4
> +
> +       -
> +       -  O_RDWR read/write access
> +
> +    -  .. row 5
> +
> +       -
> +       -  O_NONBLOCK open in non-blocking mode
> +
> +    -  .. row 6
> +
> +       -
> +       -  (blocking mode is the default)
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call opens a named audio device (e.g.
> +/dev/dvb/adapter0/audio0) for subsequent use. When an open() call has
> +succeeded, the device will be ready for use. The significance of
> +blocking or non-blocking mode is described in the documentation for
> +functions where there is a difference. It does not affect the semantics
> +of the open() call itself. A device opened in blocking mode can later be
> +put into non-blocking mode (and vice versa) using the F_SETFL command
> +of the fcntl system call. This is a standard system call, documented in
> +the Linux manual page for fcntl. Only one user can open the Audio Device
> +in O_RDWR mode. All other attempts to open the device in this mode will
> +fail, and an error code will be returned. If the Audio Device is opened
> +in O_RDONLY mode, the only ioctl call that can be used is
> +`AUDIO_GET_STATUS`_. All other call will return with an error code.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``ENODEV``
> +
> +       -  Device driver not loaded/available.
> +
> +    -  .. row 2
> +
> +       -  ``EBUSY``
> +
> +       -  Device or resource busy.
> +
> +    -  .. row 3
> +
> +       -  ``EINVAL``
> +
> +       -  Invalid argument.
> +
> +
> +close()
> +-------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 int  close(int fd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call closes a previously opened audio device.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EBADF``
> +
> +       -  fd is not a valid open file descriptor.
> +
> +
> +
> +write()
> +-------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	 size_t write(int fd, const void *buf, size_t count)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  void \*buf
> +
> +       -  Pointer to the buffer containing the PES data.
> +
> +    -  .. row 3
> +
> +       -  size_t count
> +
> +       -  Size of buf.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call can only be used if AUDIO_SOURCE_MEMORY is selected
> +in the ioctl call `AUDIO_SELECT_SOURCE`_. The data provided shall be in
> +PES format. If O_NONBLOCK is not specified the function will block
> +until buffer space is available. The amount of data to be transferred is
> +implied by count.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EPERM``
> +
> +       -  Mode AUDIO_SOURCE_MEMORY not selected.
> +
> +    -  .. row 2
> +
> +       -  ``ENOMEM``
> +
> +       -  Attempted to write more data than the internal buffer can hold.
> +
> +    -  .. row 3
> +
> +       -  ``EBADF``
> +
> +       -  fd is not a valid open file descriptor.



> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api=
.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.rst
> new file mode 100644
> index 000000000000..566aa7b8eee6
> --- /dev/null
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.rst

Better to send a patch series, with one patch per API. Makes easier
to review.

> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _legacy_dvb_decoder_api:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +Legacy DVB MPEG Decoder APIs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +.. _legacy_dvb_decoder_notes:
> +
> +General Notes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This API has originally been designed for DVB only and is therefore limi=
ted to
> +the :ref:`legacy_dvb_decoder_formats` used in such digital TV-broadcasts=
ystems.
> +
> +To circumvent this limitations the more versatile :ref:`V4L2 <v4l2spec>`=
 API has
> +been designed. Which replaces this part of the DVB API.
> +
> +Nevertheless there have been projects build around this API.
> +To ensure compatibility this API is kept as it is.
> +
> +.. attention:: Do **not** use this API in new drivers!
> +
> +    For audio and video use the :ref:`V4L2 <v4l2spec>` and ALSA APIs.
> +
> +    Pipelines should be set up using the :ref:`Media Controller  API<med=
ia_controller>`.
> +
> +Practically the decoders seem to be treated differently. The application=
 typically
> +knows which decoder is in use or it is specially written for one decoder=
 type.
> +Querying capabilities are rarely used because they are already known.
> +
> +.. _legacy_dvb_decoder_formats:
> +
> +Data Formats
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The API has been designed for DVB and compatible broadcastsystems.
> +Because of that fact the only supported data formats are ISO/IEC 13818-1
> +compatible MPEG streams. The supported payloads may vary depending on the
> +used decoder.
> +
> +Timestamps are always MPEG PTS as defined in ITU T-REC-H.222.0 /
> +ISO/IEC 13818-1, if not otherwise noted.
> +
> +For storing recordings typically TS streams are used, in lesser extent P=
ES.
> +Both variants are commonly accepted for playback, but it may be driver d=
ependent.
> +
> +
> +
> +
> +Table of Contents
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +    :maxdepth: 2
> +
> +    legacy_dvb_video
> +    legacy_dvb_audio
> +    legacy_dvb_osd
> +
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst b/D=
ocumentation/userspace-api/media/dvb/legacy_dvb_osd.rst
> new file mode 100644
> index 000000000000..2174440e77c5
> --- /dev/null
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst
> @@ -0,0 +1,444 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _dvb_osd:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DVB OSD Device
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +The DVB OSD Device controls the OnScreenDisplay of the AV7110 based
> +DVB-cards with hardware MPEG2 decoder. It can be accessed through ``/dev=
/dvb/adapter?/osd0``.
> +Data types and ioctl definitions can be accessed by including
> +``linux/dvb/osd.h`` in your application.
> +
> +The OSD is not a framebuffer like on many other cards.
> +It is a kind of canvas one can draw on.
> +The colordepth is limited depending on the memorysize installed. An appr=
opriate palette
> +of colors has to be set up.
> +The installed memory size can be identified with the `OSD_GET_CAPABILITY=
`_ ioctl.
> +
> +OSD Data Types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +OSD_Command
> +-----------
> +
> +The ``OSD_Command`` data type defined by
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	/* All functions return -2 on "not open" */
> +	OSD_Close =3D 1,	/* () */
> +	/*
> +	 * Disables OSD and releases the buffers
> +	 * returns 0 on success
> +	 */
> +	OSD_Open,	/* (x0,y0,x1,y1,BitPerPixel[2/4/8](color&0x0F),mix[0..15](col=
or&0xF0)) */
> +	/*
> +	 * Opens OSD with this size and bit depth
> +	 * returns 0 on success, -1 on DRAM allocation error, -2 on "already op=
en"
> +	 */
> +	OSD_Show,	/* () */
> +	/*
> +	 * enables OSD mode
> +	 * returns 0 on success
> +	 */
> +	OSD_Hide,	/* () */
> +	/*
> +	 * disables OSD mode
> +	 * returns 0 on success
> +	 */
> +	OSD_Clear,	/* () */
> +	/*
> +	 * Sets all pixel to color 0
> +	 * returns 0 on success
> +	 */
> +	OSD_Fill,	/* (color) */
> +	/*
> +	 * Sets all pixel to color <col>
> +	 * returns 0 on success
> +	 */
> +	OSD_SetColor,	/* (color,R{x0},G{y0},B{x1},opacity{y1}) */
> +	/*
> +	 * set palette entry <num> to <r,g,b>, <mix> and <trans> apply
> +	 * R,G,B: 0..255
> +	 * R=3DRed, G=3DGreen, B=3DBlue
> +	 * opacity=3D0:      pixel opacity 0% (only video pixel shows)
> +	 * opacity=3D1..254: pixel opacity as specified in header
> +	 * opacity=3D255:    pixel opacity 100% (only OSD pixel shows)
> +	 * returns 0 on success, -1 on error
> +	 */
> +	OSD_SetPalette,	/* (firstcolor{color},lastcolor{x0},data) */
> +	/*
> +	 * Set a number of entries in the palette
> +	 * sets the entries "firstcolor" through "lastcolor" from the array "da=
ta"
> +	 * data has 4 byte for each color:
> +	 * R,G,B, and a opacity value: 0->transparent, 1..254->mix, 255->pixel
> +	 */
> +	OSD_SetTrans,	/* (transparency{color}) */
> +	/*
> +	 * Sets transparency of mixed pixel (0..15)
> +	 * returns 0 on success
> +	 */
> +	OSD_SetPixel,	/* (x0,y0,color) */
> +	/*
> +	 * sets pixel <x>,<y> to color number <col>
> +	 * returns 0 on success, -1 on error
> +	 */
> +	OSD_GetPixel,	/* (x0,y0) */
> +	/* returns color number of pixel <x>,<y>,  or -1 */
> +	OSD_SetRow,	/* (x0,y0,x1,data) */
> +	/*
> +	 * fills pixels x0,y through  x1,y with the content of data[]
> +	 * returns 0 on success, -1 on clipping all pixel (no pixel drawn)
> +	 */
> +	OSD_SetBlock,	/* (x0,y0,x1,y1,increment{color},data) */
> +	/*
> +	 * fills pixels x0,y0 through  x1,y1 with the content of data[]
> +	 * inc contains the width of one line in the data block,
> +	 * inc<=3D0 uses blockwidth as linewidth
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_FillRow,	/* (x0,y0,x1,color) */
> +	/*
> +	 * fills pixels x0,y through  x1,y with the color <col>
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_FillBlock,	/* (x0,y0,x1,y1,color) */
> +	/*
> +	 * fills pixels x0,y0 through  x1,y1 with the color <col>
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_Line,	/* (x0,y0,x1,y1,color) */
> +	/*
> +	 * draw a line from x0,y0 to x1,y1 with the color <col>
> +	 * returns 0 on success
> +	 */
> +	OSD_Query,	/* (x0,y0,x1,y1,xasp{color}}), yasp=3D11 */
> +	/*
> +	 * fills parameters with the picture dimensions and the pixel aspect ra=
tio
> +	 * returns 0 on success
> +	 */
> +	OSD_Test,       /* () */
> +	/*
> +	 * draws a test picture. for debugging purposes only
> +	 * returns 0 on success
> +	 * TODO: remove "test" in final version
> +	 */
> +	OSD_Text,	/* (x0,y0,size,color,text) */
> +	OSD_SetWindow,	/* (x0) set window with number 0<x0<8 as current */
> +	OSD_MoveWindow,	/* move current window to (x0, y0) */
> +	OSD_OpenRaw,	/* Open other types of OSD windows */
> +    } OSD_Command;
> +
> +is used with the `OSD_SEND_CMD`_ ioctl to tell the driver which OSD_Comm=
and to execute.
> +
> +osd_cmd_t
> +---------
> +
> +The ``osd_cmd_t`` data type defined by
> +
> +.. code-block:: c
> +
> +    typedef struct osd_cmd_s {
> +	OSD_Command cmd;
> +	int x0;
> +	int y0;
> +	int x1;
> +	int y1;
> +	int color;
> +	void __user *data;
> +    } osd_cmd_t;
> +
> +is used with the `OSD_SEND_CMD`_ ioctl.
> +It contains the data for the OSD_Command and the `OSD_Command`_ itself.
> +
> +
> +osd_raw_window_t
> +----------------
> +
> +The ``osd_raw_window_t`` data type defined by
> +
> +.. code-block:: c
> +
> +    /* OSD_OpenRaw: set 'color' to desired window type */
> +    typedef enum {
> +	OSD_BITMAP1,           /* 1 bit bitmap */
> +	OSD_BITMAP2,           /* 2 bit bitmap */
> +	OSD_BITMAP4,           /* 4 bit bitmap */
> +	OSD_BITMAP8,           /* 8 bit bitmap */
> +	OSD_BITMAP1HR,         /* 1 Bit bitmap half resolution */
> +	OSD_BITMAP2HR,         /* 2 bit bitmap half resolution */
> +	OSD_BITMAP4HR,         /* 4 bit bitmap half resolution */
> +	OSD_BITMAP8HR,         /* 8 bit bitmap half resolution */
> +	OSD_YCRCB422,          /* 4:2:2 YCRCB Graphic Display */
> +	OSD_YCRCB444,          /* 4:4:4 YCRCB Graphic Display */
> +	OSD_YCRCB444HR,        /* 4:4:4 YCRCB graphic half resolution */
> +	OSD_VIDEOTSIZE,        /* True Size Normal MPEG Video Display */
> +	OSD_VIDEOHSIZE,        /* MPEG Video Display Half Resolution */
> +	OSD_VIDEOQSIZE,        /* MPEG Video Display Quarter Resolution */
> +	OSD_VIDEODSIZE,        /* MPEG Video Display Double Resolution */
> +	OSD_VIDEOTHSIZE,       /* True Size MPEG Video Display Half Resolution =
*/
> +	OSD_VIDEOTQSIZE,       /* True Size MPEG Video Display Quarter Resoluti=
on*/
> +	OSD_VIDEOTDSIZE,       /* True Size MPEG Video Display Double Resolutio=
n */
> +	OSD_VIDEONSIZE,        /* Full Size MPEG Video Display */
> +	OSD_CURSOR             /* Cursor */
> +    } osd_raw_window_t;
> +
> +is used to tell the `OSD_Command`_ OSD_OpenRaw which type of OSD to open.
> +
> +osd_cap_t
> +---------
> +
> +The following is the structure of data returned by the `OSD_GET_CAPABILI=
TY`_ call.
> +
> +The ``osd_cap_t`` data type defined by
> +
> +.. code-block:: c
> +
> +    typedef struct osd_cap_s {
> +	int  cmd;
> +    #define OSD_CAP_MEMSIZE         1  /* memory size */
> +	long val;
> +    } osd_cap_t;
> +
> +OSD Function Calls
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +OSD_SEND_CMD
> +------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +    int ioctl(int fd, int request =3D OSD_SEND_CMD, enum osd_cmd_t *cmd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals `osd_cmd_t`_ for this command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl sends the `OSD_Command`_ to the card.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.

It is probably a good idea to mention the error code when command
is out of range.

> +
> +OSD_GET_CAPABILITY
> +------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +    int ioctl(int fd, int request =3D OSD_GET_CAPABILITY, struct osd_cap=
_t *cap)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals OSD_GET_CAPABILITY for this command.
> +
> +    -  .. row 3
> +
> +       -  unsigned int \*cap
> +
> +       -  Pointer to a location where to store the capability informatio=
n.

Huh? Isn't struct osd_cap_t a structure with cmd, value?

Also, from the implementation, cap->cmd needs to be filled by userspace.
You'll need to describe it, and what are the acceptable values and
value ranges. The av7110 supports just one cmd:

        switch (cap->cmd) {
        case OSD_CAP_MEMSIZE:
                if (FW_4M_SDRAM(av7110->arm_app))
                        cap->val =3D 1000000;
                else
                        cap->val =3D 92000;
                return 0;
        default:
                return -EINVAL;
        }

You should probably tell that -EINVAL means that the capability is
not supported.

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is used to get the capabilities of the OSD of the AV7110 base=
d DVB-decoder-card in use.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +open()
> +------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +    int open(const char *deviceName, int flags)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  const char \*deviceName
> +
> +       -  Name of specific OSD device.
> +
> +    -  .. row 2
> +
> +       -  int flags
> +
> +       -  A bit-wise OR of the following flags:
> +
> +    -  .. row 3
> +
> +       -
> +       -  O_RDONLY read-only access
> +
> +    -  .. row 4
> +
> +       -
> +       -  O_RDWR read/write access
> +
> +    -  .. row 5
> +
> +       -
> +       -  O_NONBLOCK open in non-blocking mode
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call opens a named OSD device (e.g.
> +/dev/dvb/adapter?/osd0) for subsequent use.
> +
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``ENODEV``
> +
> +       -  Device driver not loaded/available.
> +
> +    -  .. row 2
> +
> +       -  ``EINTERNAL``
> +
> +       -  Internal error.
> +
> +    -  .. row 3
> +
> +       -  ``EBUSY``
> +
> +       -  Device or resource busy.
> +
> +    -  .. row 4
> +
> +       -  ``EINVAL``
> +
> +       -  Invalid argument.
> +
> +close()
> +-------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +    int close(int fd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_ .
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call closes a previously opened OSD device.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EBADF``
> +
> +       -  fd is not a valid open file descriptor.
> +
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b=
/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> new file mode 100644
> index 000000000000..ae0c1e8a54b8
> --- /dev/null
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> @@ -0,0 +1,1768 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _dvb_video:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DVB Video Device
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +The DVB video device controls the MPEG2 video decoder of the DVB
> +hardware. It can be accessed through ``/dev/dvb/adapter0/video0``. Data
> +types and ioctl definitions can be accessed by including
> +``linux/dvb/video.h`` in your application.
> +
> +Note that the DVB video device only controls decoding of the MPEG video
> +stream, not its presentation on the TV or computer screen. On PCs this
> +is typically handled by an associated video4linux device, e.g.
> +``/dev/video``, which allows scaling and defining output windows.
> +
> +Most DVB cards don=E2=80=99t have their own MPEG decoder, which results =
in the
> +omission of the audio and video device as well as the video4linux
> +device.
> +
> +These ioctls were also used by V4L2 to control MPEG decoders implemented
> +in V4L2. The use of these ioctls for that purpose has been made obsolete
> +and proper V4L2 ioctls or controls have been created to replace that
> +functionality. Use :ref:`V4L2 ioctls<video>` for new drivers!
> +
> +
> +Video Data Types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +video_format_t
> +--------------
> +
> +The ``video_format_t`` data type defined by
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	VIDEO_FORMAT_4_3,     /* Select 4:3 format */
> +	VIDEO_FORMAT_16_9,    /* Select 16:9 format. */
> +	VIDEO_FORMAT_221_1    /* 2.21:1 */
> +    } video_format_t;
> +
> +is used in the `VIDEO_SET_FORMAT`_ function to tell the driver which
> +aspect ratio the output hardware (e.g. TV) has. It is also used in the
> +data structures `video_status`_ returned by `VIDEO_GET_STATUS`_
> +and `video_event`_ returned by `VIDEO_GET_EVENT`_ which report
> +about the display format of the current video stream.
> +
> +
> +video_displayformat_t
> +---------------------
> +
> +In case the display format of the video stream and of the display
> +hardware differ the application has to specify how to handle the
> +cropping of the picture. This can be done using the
> +`VIDEO_SET_DISPLAY_FORMAT`_ call which accepts
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	VIDEO_PAN_SCAN,       /* use pan and scan format */
> +	VIDEO_LETTER_BOX,     /* use letterbox format */
> +	VIDEO_CENTER_CUT_OUT  /* use center cut out format */
> +    } video_displayformat_t;
> +
> +as argument.
> +
> +
> +video_size_t
> +------------
> +
> +Used in the struct `video_event`_. It stores the resolution and
> +aspect ratio of the video.
> +
> +.. code-block:: c
> +
> +    typedef struct {
> +	int w;
> +	int h;
> +	video_format_t aspect_ratio;
> +    } video_size_t;
> +
> +
> +video_stream_source_t
> +---------------------
> +
> +The video stream source is set through the `VIDEO_SELECT_SOURCE`_ call
> +and can take the following values, depending on whether we are replaying
> +from an internal (demuxer) or external (user write) source.
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	VIDEO_SOURCE_DEMUX, /* Select the demux as the main source */
> +	VIDEO_SOURCE_MEMORY /* If this source is selected, the stream
> +		       comes from the user through the write
> +		       system call */
> +    } video_stream_source_t;

FYI, this carries the same problem as the audio one: this API is problematic
for modern hardware that has multiple tuners and demuxers. Setting up=20
pipelines for audio and video decoding on modern hardware require a lot=20
more than just demux/memory.

> +
> +VIDEO_SOURCE_DEMUX selects the demultiplexer (fed either by the
> +frontend or the DVR device) as the source of the video stream. If
> +VIDEO_SOURCE_MEMORY is selected the stream comes from the application
> +through the `write()`_ system call.
> +
> +
> +video_play_state_t
> +------------------
> +
> +The following values can be returned by the `VIDEO_GET_STATUS`_ call
> +representing the state of video playback.
> +
> +
> +.. code-block:: c
> +
> +    typedef enum {
> +	VIDEO_STOPPED, /* Video is stopped */
> +	VIDEO_PLAYING, /* Video is currently playing */
> +	VIDEO_FREEZED  /* Video is freezed */
> +    } video_play_state_t;
> +
> +
> +struct video_command
> +--------------------
> +
> +The structure must be zeroed before use by the application. This ensures
> +it can be extended safely in the future.
> +
> +
> +.. code-block:: c
> +
> +    struct video_command {
> +	__u32 cmd;
> +	__u32 flags;
> +	union {
> +	    struct {
> +		__u64 pts;
> +	    } stop;
> +
> +	    struct {
> +		/* 0 or 1000 specifies normal speed,
> +		   1 specifies forward single stepping,
> +		   -1 specifies backward single stepping,
> +		   >>1: playback at speed/1000 of the normal speed,

I guess you meant > 1, right?

> +		   <-1: reverse playback at (-speed/1000) of the normal speed. */
> +		__s32 speed;
> +		__u32 format;
> +	    } play;
> +
> +	    struct {
> +		__u32 data[16];
> +	    } raw;
> +	};
> +    };
> +
> +
> +Predefined decoder commands and flags:
> +
> +.. code-block:: c
> +
> +    /* Decoder commands */
> +    #define VIDEO_CMD_PLAY        (0)
> +    #define VIDEO_CMD_STOP        (1)
> +    #define VIDEO_CMD_FREEZE      (2)
> +    #define VIDEO_CMD_CONTINUE    (3)
> +
> +    /* Flags for VIDEO_CMD_FREEZE */
> +    #define VIDEO_CMD_FREEZE_TO_BLACK	(1 << 0)
> +
> +    /* Flags for VIDEO_CMD_STOP */
> +    #define VIDEO_CMD_STOP_TO_BLACK	(1 << 0)
> +    #define VIDEO_CMD_STOP_IMMEDIATELY	(1 << 1)
> +
> +    /* Play input formats: */
> +    /* The decoder has no special format requirements */
> +    #define VIDEO_PLAY_FMT_NONE         (0)
> +    /* The decoder requires full GOPs */
> +    #define VIDEO_PLAY_FMT_GOP          (1)
> +
> +    /* FIELD_UNKNOWN can be used if the hardware does not know whether
> +    the Vsync is for an odd, even or progressive (i.e. non-interlaced)
> +    field. */
> +    #define VIDEO_VSYNC_FIELD_UNKNOWN		(0)
> +    #define VIDEO_VSYNC_FIELD_ODD		(1)
> +    #define VIDEO_VSYNC_FIELD_EVEN		(2)
> +    #define VIDEO_VSYNC_FIELD_PROGRESSIVE	(3)

Please explain the meaning for each of them. Ok, most are obvious, but
some aren't.

> +
> +
> +
> +video_event
> +-----------
> +
> +The following is the structure of a video event as it is returned by the
> +`VIDEO_GET_EVENT`_ call.
> +
> +
> +.. code-block:: c
> +
> +    struct video_event {
> +	__s32 type;
> +    #define VIDEO_EVENT_SIZE_CHANGED        1
> +    #define VIDEO_EVENT_FRAME_RATE_CHANGED  2
> +    #define VIDEO_EVENT_DECODER_STOPPED     3
> +    #define VIDEO_EVENT_VSYNC               4
> +	long timestamp;                 /* MPEG PTS */
> +	union {
> +	    video_size_t size;
> +	    unsigned int frame_rate;    /* in frames per 1000sec */
> +	    unsigned char vsync_field;  /* unknown/odd/even/progressive */
> +	} u;
> +    };

This one requires more explanation to help implementing userspace
support. for instance, what happens if another event occurs
before userspace reads the first one? Will they be preserved
or the new one will override the last one?

vsync_field is also not well specified.. e. g. what's a random=20
value (2, for instance) means?

> +
> +
> +video_status
> +------------
> +
> +The `VIDEO_GET_STATUS`_ call returns the following structure informing
> +about various states of the playback operation.
> +
> +
> +.. code-block:: c
> +
> +    struct video_status {
> +	int                   video_blank;   /* blank video on freeze? */
> +	video_play_state_t    play_state;    /* current state of playback */
> +	video_stream_source_t stream_source; /* current source (demux/memory) */
> +	video_format_t        video_format;  /* current aspect ratio of stream =
*/
> +	video_displayformat_t display_format;/* applied cropping mode */
> +    };

Better to use a table to explain each field, placing the possible values
and what they mean.

> +
> +If video_blank is set

Set to what? a value different than zero?

> video will be blanked out if the channel is
> +changed or if playback is stopped. Otherwise, the last picture will be
> +displayed. play_state indicates if the video is currently frozen,
> +stopped, or being played back. The stream_source corresponds to the
> +selected source for the video stream. It can come either from the
> +demultiplexer or from memory. The video_format indicates the aspect
> +ratio (one of 4:3 or 16:9) of the currently played video stream.
> +Finally, display_format corresponds to the applied cropping mode in
> +case the source video format is not the same as the format of the output
> +device.
> +
> +
> +video_still_picture
> +-------------------
> +
> +An I-frame displayed via the `VIDEO_STILLPICTURE`_ call is passed on
> +within the following structure.
> +
> +
> +.. code-block:: c
> +
> +    /* pointer to and size of a single iframe in memory */
> +    struct video_still_picture {
> +    char *iFrame;        /* pointer to a single iframe in memory */
> +    int32_t size;
> +    };
> +
> +
> +video capabilities
> +------------------
> +
> +A call to `VIDEO_GET_CAPABILITIES`_ returns an unsigned integer with the
> +following bits set according to the hardwares capabilities.
> +
> +
> +.. code-block:: c
> +
> +    /* bit definitions for capabilities: */
> +    /* can the hardware decode MPEG1 and/or MPEG2? */
> +    #define VIDEO_CAP_MPEG1   1
> +    #define VIDEO_CAP_MPEG2   2
> +    /* does the video device accept system and/or program stream?
> +    (you still have to open the video and the audio device
> +    but only send the stream to the video device) */
> +    #define VIDEO_CAP_SYS     4
> +    #define VIDEO_CAP_PROG    8


Please better describe the fields, specially bits 2 and 3
(VIDEO_CAP_SYS and VIDEO_CAP_PROG).

> +
> +
> +Video Function Calls
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +VIDEO_STOP
> +----------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_STOP, boolean mode)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_STOP for this command.
> +
> +    -  .. row 3
> +
> +       -  Boolean mode
> +
> +       -  Indicates how the screen shall be handled.
> +
> +    -  .. row 4
> +
> +       -
> +       -  TRUE: Blank screen when stop.
> +
> +    -  .. row 5
> +
> +       -
> +       -  FALSE: Show last decoded frame.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for Digital TV devices only. To control a V4L2 decoder use=
 the
> +V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
> +
> +This ioctl call asks the Video Device to stop playing the current
> +stream. Depending on the input parameter, the screen can be blanked out
> +or displaying the last decoded frame.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_PLAY
> +----------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_PLAY)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_PLAY for this command.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for Digital TV devices only. To control a V4L2 decoder use=
 the
> +V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
> +
> +This ioctl call asks the Video Device to start playing a video stream
> +from the selected source.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_FREEZE
> +------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_FREEZE)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_FREEZE for this command.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for Digital TV devices only. To control a V4L2 decoder use=
 the
> +V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
> +
> +This ioctl call suspends the live video stream being played. Decoding
> +and playing are frozen. It is then possible to restart the decoding and
> +playing process of the video stream using the `VIDEO_CONTINUE`_ command.
> +If VIDEO_SOURCE_MEMORY is selected in the ioctl call
> +`VIDEO_SELECT_SOURCE`_, the Digital TV subsystem will not decode any mor=
e data
> +until the ioctl call `VIDEO_CONTINUE`_ or `VIDEO_PLAY`_ is performed.

What if VIDEO_SOURCE_DEMUX is selected?

> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_CONTINUE
> +--------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_CONTINUE)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_CONTINUE for this command.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for Digital TV devices only. To control a V4L2 decoder use=
 the
> +V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
> +
> +This ioctl call restarts decoding and playing processes of the video
> +stream which was played before a call to `VIDEO_FREEZE`_ was made.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_SELECT_SOURCE
> +-------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_SELECT_SOURCE, video_stream_source_t source)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SELECT_SOURCE for this command.
> +
> +    -  .. row 3
> +
> +       -  `video_stream_source_t`_ source
> +
> +       -  Indicates which source shall be used for the Video stream.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for Digital TV devices only. This ioctl was also supported=
 by the
> +V4L2 ivtv driver, but that has been replaced by the ivtv-specific
> +``IVTV_IOC_PASSTHROUGH_MODE`` ioctl.
> +
> +This ioctl call informs the video device which source shall be used for
> +the input data. The possible sources are demux or memory. If memory is
> +selected, the data is fed to the video device through the write command
> +using the struct `video_stream_source_t`_.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_SET_BLANK
> +---------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, VIDEO_SET_BLANK, boolean mode)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SET_BLANK for this command.
> +
> +    -  .. row 3
> +
> +       -  boolean mode
> +
> +       -  TRUE: Blank screen when stop.
> +
> +    -  .. row 4
> +
> +       -
> +       -  FALSE: Show last decoded frame.
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to blank out the picture.
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_GET_STATUS
> +----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_GET_STATUS, struct video_status *st=
atus)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_STATUS for this command.
> +
> +    -  .. row 3
> +
> +       -  struct `video_status`_ \*status
> +
> +       -  Returns the current status of the Video Device.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to return the current status of
> +the device.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_GET_EVENT
> +---------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_GET_EVENT, struct video_event *ev)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_EVENT for this command.
> +
> +    -  .. row 3
> +
> +       -  struct `video_event`_ \*ev
> +
> +       -  Points to the location where the event, if any, is to be store=
d.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl is for DVB devices only. To get events from a V4L2 decoder
> +use the V4L2 :ref:`VIDIOC_DQEVENT` ioctl instead.
> +
> +This ioctl call returns an event of type `video_event`_ if available. If
> +an event is not available, the behavior depends on whether the device is
> +in blocking or non-blocking mode. In the latter case, the call fails
> +immediately with errno set to ``EWOULDBLOCK``. In the former case, the c=
all
> +blocks until an event becomes available. The standard Linux poll()
> +and/or select() system calls can be used with the device file descriptor
> +to watch for new events. For select(), the file descriptor should be
> +included in the exceptfds argument, and for poll(), POLLPRI should be
> +specified as the wake-up condition. Read-only permissions are sufficient
> +for this ioctl call.


Same comments as I did for demux event applies here: what happens if
userspace misses the event?

Btw, this explanation is a lot better than the one at demux. You
should probably place something like that there too... there is
block/nonblock mode for the demux event? Do they behave the same?

> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EWOULDBLOCK``
> +
> +       -  There is no event pending, and the device is in non-blocking m=
ode.
> +
> +    -  .. row 2
> +
> +       -  ``EOVERFLOW``
> +
> +       -  Overflow in event queue - one or more events were lost.
> +
> +
> +VIDEO_SET_DISPLAY_FORMAT
> +------------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_SET_DISPLAY_FORMAT, video_display_f=
ormat_t format)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SET_DISPLAY_FORMAT for this command.
> +
> +    -  .. row 3
> +
> +       -  `video_displayformat_t`_ format
> +
> +       -  Selects the video format to be used.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to select the video format to be
> +applied by the MPEG chip on the video.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_STILLPICTURE
> +------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_STILLPICTURE, struct video_still_pi=
cture *sp)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_STILLPICTURE for this command.
> +
> +    -  .. row 3
> +
> +       -  struct `video_still_picture`_ \*sp
> +
> +       -  Pointer to a location where an I-frame and size is stored.

Please describe it better. In particular, how the data is stored?

- video format(s);
- video codec (if the frame is not in raw format);
- colorspace;
- size;
- resolution;
- etc.

Is it a MJPEG/JPEG frame with all headers stored in a way it can be used by
a normal mjpeg-capable image viewer? Are there just one possible encoding?

On other words, the spec should let it clear about how userspace can
use this information to produce an image that can be displayed.

You may need to mention the need to call some other ioctls to get more
details about the image, if needed.

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to display a still picture
> +(I-frame). The input data shall contain an I-frame. If the pointer is
> +NULL, then the current displayed still picture is blanked.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_FAST_FORWARD
> +------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_FAST_FORWARD, int nFrames)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_FAST_FORWARD for this command.
> +
> +    -  .. row 3
> +
> +       -  int nFrames
> +
> +       -  The number of frames to skip.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to skip decoding of N number of
> +I-frames. This call can only be used if VIDEO_SOURCE_MEMORY is
> +selected.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EPERM``
> +
> +       -  Mode VIDEO_SOURCE_MEMORY not selected.
> +
> +
> +VIDEO_SLOWMOTION
> +----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_SLOWMOTION, int nFrames)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SLOWMOTION for this command.
> +
> +    -  .. row 3
> +
> +       -  int nFrames
> +
> +       -  The number of times to repeat each frame.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the video device to repeat decoding frames N number
> +of times. This call can only be used if VIDEO_SOURCE_MEMORY is
> +selected.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EPERM``
> +
> +       -  Mode VIDEO_SOURCE_MEMORY not selected.
> +
> +
> +VIDEO_GET_CAPABILITIES
> +----------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_GET_CAPABILITIES, unsigned int *cap)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_CAPABILITIES for this command.
> +
> +    -  .. row 3
> +
> +       -  unsigned int \*cap
> +
> +       -  Pointer to a location where to store the capability informatio=
n.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the video device about its decoding capabilities.
> +On success it returns and integer which has bits set according to the
> +defines in section ??.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_CLEAR_BUFFER
> +------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_CLEAR_BUFFER)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_CLEAR_BUFFER for this command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call clears all video buffers in the driver and in the
> +decoder hardware.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_SET_STREAMTYPE
> +--------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_SET_STREAMTYPE, int type)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SET_STREAMTYPE for this command.
> +
> +    -  .. row 3
> +
> +       -  int type
> +
> +       -  stream type

What are the valid types?

> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl tells the driver which kind of stream to expect being written
> +to it. If this call is not used the default of video PES is used. Some
> +drivers might not support this call and always expect PES.
> +Intelligent decoder might also not support or ignore this call and
> +determine the streamtype themselves.
> +
> +.. note:: See: :ref:`DVB Data Formats <legacy_dvb_decoder_formats>`
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_SET_FORMAT
> +----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(fd, int request =3D VIDEO_SET_FORMAT, video_format_t format)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_SET_FORMAT for this command.
> +
> +    -  .. row 3
> +
> +       -  `video_format_t`_ format
> +
> +       -  video format of TV as defined in section ??.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl sets the screen format (aspect ratio) of the connected output
> +device (TV) so that the output of the decoder can be adjusted
> +accordingly.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_GET_SIZE
> +--------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(int fd, int request =3D VIDEO_GET_SIZE, video_size_t *size)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_SIZE for this command.
> +
> +    -  .. row 3
> +
> +       -  `video_size_t`_ \*size
> +
> +       -  Returns the size and aspect ratio.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl returns the size and aspect ratio.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_GET_PTS
> +-------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(int fd, int request =3D VIDEO_GET_PTS, __u64 *pts)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_PTS for this command.
> +
> +    -  .. row 3
> +
> +       -  __u64 \*pts
> +
> +       -  Returns the 33-bit timestamp as defined in ITU T-REC-H.222.0 /
> +	  ISO/IEC 13818-1.
> +
> +	  The PTS should belong to the currently played frame if possible,
> +	  but may also be a value close to it like the PTS of the last
> +	  decoded frame or the last PTS extracted by the PES parser.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +For V4L2 decoders this ioctl has been replaced by the
> +``V4L2_CID_MPEG_VIDEO_DEC_PTS`` control.
> +
> +This ioctl call asks the Video Device to return the current PTS
> +timestamp.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_GET_FRAME_RATE
> +--------------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(int fd, int request =3D VIDEO_GET_FRAME_RATE, unsigned int *r=
ate)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_GET_FRAME_RATE for this command.
> +
> +    -  .. row 3
> +
> +       -  unsigned int \*rate
> +
> +       -  Returns the framerate in number of frames per 1000 seconds.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +This ioctl call asks the Video Device to return the current framerate.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_COMMAND
> +-------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(int fd, int request =3D VIDEO_COMMAND, struct video_command *=
cmd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_COMMAND for this command.
> +
> +    -  .. row 3
> +
> +       -  `struct video_command`_ \*cmd
> +
> +       -  Commands the decoder.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +For V4L2 decoders this ioctl has been replaced by the
> +:ref:`VIDIOC_DECODER_CMD` ioctl.
> +
> +This ioctl commands the decoder. The `struct video_command`_ is a
> +subset of the ``v4l2_decoder_cmd`` struct, so refer to the
> +:ref:`VIDIOC_DECODER_CMD` documentation for
> +more information.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +VIDEO_TRY_COMMAND
> +-----------------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int ioctl(int fd, int request =3D VIDEO_TRY_COMMAND, struct video_comma=
nd *cmd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  int request
> +
> +       -  Equals VIDEO_TRY_COMMAND for this command.
> +
> +    -  .. row 3
> +
> +       -  `struct video_command`_ \*cmd
> +
> +       -  Try a decoder command.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +.. attention:: Do **not** use in new drivers!
> +             See: :ref:`legacy_dvb_decoder_notes`
> +
> +For V4L2 decoders this ioctl has been replaced by the
> +:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` ioctl.
> +
> +This ioctl tries a decoder command. The `struct video_command`_ is a
> +subset of the ``v4l2_decoder_cmd`` struct, so refer to the
> +:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` documentation
> +for more information.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +
> +open()
> +------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int open(const char *deviceName, int flags)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  const char \*deviceName
> +
> +       -  Name of specific video device.
> +
> +    -  .. row 2
> +
> +       -  int flags
> +
> +       -  A bit-wise OR of the following flags:
> +
> +    -  .. row 3
> +
> +       -
> +       -  O_RDONLY read-only access
> +
> +    -  .. row 4
> +
> +       -
> +       -  O_RDWR read/write access
> +
> +    -  .. row 5
> +
> +       -
> +       -  O_NONBLOCK open in non-blocking mode
> +
> +    -  .. row 6
> +
> +       -
> +       -  (blocking mode is the default)
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call opens a named video device (e.g.
> +/dev/dvb/adapter?/video?) for subsequent use.
> +
> +When an open() call has succeeded, the device will be ready for use. The
> +significance of blocking or non-blocking mode is described in the
> +documentation for functions where there is a difference. It does not
> +affect the semantics of the open() call itself. A device opened in
> +blocking mode can later be put into non-blocking mode (and vice versa)
> +using the F_SETFL command of the fcntl system call. This is a standard
> +system call, documented in the Linux manual page for fcntl. Only one
> +user can open the Video Device in O_RDWR mode. All other attempts to
> +open the device in this mode will fail, and an error-code will be
> +returned. If the Video Device is opened in O_RDONLY mode, the only
> +ioctl call that can be used is `VIDEO_GET_STATUS`_. All other call will
> +return an error code.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``ENODEV``
> +
> +       -  Device driver not loaded/available.
> +
> +    -  .. row 2
> +
> +       -  ``EINTERNAL``
> +
> +       -  Internal error.
> +
> +    -  .. row 3
> +
> +       -  ``EBUSY``
> +
> +       -  Device or resource busy.
> +
> +    -  .. row 4
> +
> +       -  ``EINVAL``
> +
> +       -  Invalid argument.
> +
> +
> +close()
> +-------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	int close(int fd)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call closes a previously opened video device.
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EBADF``
> +
> +       -  fd is not a valid open file descriptor.
> +
> +
> +write()
> +-------
> +
> +Synopsis
> +~~~~~~~~
> +
> +.. code-block:: c
> +
> +	size_t write(int fd, const void *buf, size_t count)
> +
> +
> +Arguments
> +~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  int fd
> +
> +       -  File descriptor returned by a previous call to `open()`_.
> +
> +    -  .. row 2
> +
> +       -  void \*buf
> +
> +       -  Pointer to the buffer containing the PES data.
> +
> +    -  .. row 3
> +
> +       -  size_t count
> +
> +       -  Size of buf.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +This system call can only be used if VIDEO_SOURCE_MEMORY is selected
> +in the ioctl call `VIDEO_SELECT_SOURCE`_. The data provided shall be in
> +PES format, unless the capability allows other formats. TS is the
> +most common format for storing DVB-data, it is usually supported too.
> +If O_NONBLOCK is not specified the function will block until buffer space
> +is available. The amount of data to be transferred is implied by count.
> +
> +.. note:: See: :ref:`DVB Data Formats <legacy_dvb_decoder_formats>`
> +
> +
> +Return Value
> +~~~~~~~~~~~~
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +
> +    -  .. row 1
> +
> +       -  ``EPERM``
> +
> +       -  Mode VIDEO_SOURCE_MEMORY not selected.
> +
> +    -  .. row 2
> +
> +       -  ``ENOMEM``
> +
> +       -  Attempted to write more data than the internal buffer can hold.
> +
> +    -  .. row 3
> +
> +       -  ``EBADF``
> +
> +       -  fd is not a valid open file descriptor.
